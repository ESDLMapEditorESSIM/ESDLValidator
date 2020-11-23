from flask_restx import Api, Resource, fields
from collections import OrderedDict

from esdltools.api.controller.setup import api, ns_stats


STATS = OrderedDict([
    ('1', {'statId': '1', 'name': 'davetime', 'value': 10}),
    ('2', {'statId': '2', 'name': 'gregtime', 'value': 20}),
    ('3', {'statId': '3', 'name': 'kevintime', 'value': 30}),
])

stat_fields = {
    'statId': fields.String(required=True, description='The statId of the stat'),
    'name': fields.String(required=True, description='The name of the stat'),
    'value': fields.String(required=True, description='The value of the stat'),
}
stat = api.model('Stat', stat_fields)
statList = api.model('StatList', {
    'results': fields.Nested(stat, description='Array of stat')
})


def abort_if_stat_doesnt_exist(statId):
    if statId not in STATS:
        api.abort(404, message="Stat {} doesn't exist".format(statId))


parser = api.parser()
parser.add_argument('name', type=str, required=True, help='Name of the stat', location='form')
parser.add_argument('value', type=str, required=True, help='Value of the stat', location='form')


@ns_stats.route('/<string:statId>/')
@api.doc(responses={404: 'Stat not found'}, params={'statId': 'The statId of the stat'})
class Stat(Resource):
    """
    shows a single stat item and lets you delete a stat item
    """
    @api.doc(description='Get a stat', responses={200: 'Ok'})
    @api.marshal_with(stat)
    def get(self, statId):
        abort_if_stat_doesnt_exist(statId)
        return STATS[statId]

    @api.doc(responses={204: 'Stat deleted'})
    def delete(self, statId):
        abort_if_stat_doesnt_exist(statId)
        del STATS[statId]
        return '', 204

    @api.doc(parser=parser)
    @api.marshal_with(stat)
    def put(self, statId):
        abort_if_stat_doesnt_exist(statId)
        args = parser.parse_args()
        stat = STATS[statId]
        for item in args.keys():
            if item in stat.keys() and args[item] is not None:
                stat[item] = args[item]
        STATS[statId] = stat
        return stat, 201


@ns_stats.route('/')
class StatList(Resource):
    """
    shows a list of all stats, and lets you POST to add new stats
    """
    @api.doc(description='Get a list of stats')
    @api.marshal_with(statList)
    def get(self):
        return self._get_stats()

    def _get_stats(self):
        context = {'results': []}
        for statId in sorted(STATS.keys()):
            context['results'].append(STATS[statId])
        return context

    @api.doc(parser=parser)
    @api.marshal_with(stat, code=201)
    def post(self):
        args = parser.parse_args()
        statId = '{}'.format(int(max(STATS.keys()))+1)
        STATS[statId] = {'statId': statId,
                         'name': args['name'],  'value': args['value']}
        return STATS[statId], 201
