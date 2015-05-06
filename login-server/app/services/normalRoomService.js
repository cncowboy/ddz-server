/**
 * Created by edwardzhou on 15/5/3.
 */

var BaseRoomService = require('./baseRoomService');
var util = require('util');

var NormalRoomService = function(theApp) {
  BaseRoomService.call(this, theApp);
  this.clazzName = 'NormalRoomService';
};

util.inherits(NormalRoomService, BaseRoomService);

module.exports = NormalRoomService;