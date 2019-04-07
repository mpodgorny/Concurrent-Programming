package parameters

import "time"

var Workers = 3
var Clients = 2

var BossMinInterval = 1000 * time.Millisecond
var WorkerMinInterval = 2500 * time.Millisecond
var ClientMinInterval = 2000 * time.Millisecond
var WarehouseInterval = 10 * time.Second

var MaxAssigmentsNumber = 20
var MaxProductsNumber = 50

var MaxRandomAdd = 400.0


