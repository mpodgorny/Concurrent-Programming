package main

import (
	"fmt"
	"math/rand"
	"os"
	"sync"
	"time"

	"./parameters"
)

var printClient bool
var printBoss bool
var printWorker bool
var printWarehouse bool

func main() {

	tasks := make(chan Task, parameters.MaxAssigmentsNumber)
	results := make(chan int, parameters.MaxProductsNumber)
	var mutex = &sync.Mutex{}
	go boss(tasks, *mutex)
	for i := 0; i < parameters.Workers; i++ {
		go newWorker(i, tasks, results, *mutex)
	}
	for i:=0;i<parameters.Clients;i++ {
		go newClient(i,results, *mutex)
	}
	go actualWarehouse(results, tasks)
	menu()
}


type Task struct {
	A         int
	B         int
	operation int //random form 0 to 2
}

func randSleep() time.Duration {
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)
	return time.Duration(r1.Float64()*parameters.MaxRandomAdd) * time.Millisecond
}
func createTask() Task {
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)
	A := r1.Intn(100)
	B := r1.Intn(100)
	operation := r1.Intn(3)
	return Task{A, B, operation}
}

func boss(tasks chan Task, mutex sync.Mutex) {
	for {
		task := createTask()
		mutex.Lock()
		tasks <- task
		mutex.Unlock()
		if(printBoss) {
			fmt.Println("Boss craeted new assigment! Current assigments: ", len(tasks))
		}
		time.Sleep(parameters.BossMinInterval + randSleep())
	}


}

func newWorker(index int, tasks chan Task, results chan int, mutex sync.Mutex) {
	for {
		mutex.Lock()
		if(len(tasks)==0) {
			if (printWorker){
				fmt.Println("Worker nr ", index, " has nothing to do.")
		}
			mutex.Unlock()
		} else {

			task := <-tasks
			mutex.Unlock()
			x := createProduct(task)
			mutex.Lock()
			results <- x
			mutex.Unlock()
			if(printWorker){
				fmt.Println("Worker nr", index, " created: ", x)
			}
			}
		time.Sleep(parameters.WorkerMinInterval + randSleep())
	}
}

func newClient(index int, results chan int, mutex sync.Mutex) {
	for {
		mutex.Lock()
		if(len(results)==0){
			if (printClient) {
				fmt.Println("Client nr ", index, " found no products!")
			}
			mutex.Unlock()
		}else {
			result := <-results
			mutex.Unlock()
			if(printClient) {
				fmt.Println("Client nr", index, " bought number ", result)
			}
			}
			time.Sleep(parameters.ClientMinInterval + randSleep())
	}
}
func actualWarehouse(results chan int, tasks chan Task){
	for{
		if(printWarehouse){
			fmt.Println("Assigments to do: ", len(tasks), ". Products to sell: ", len(results))
		}
		time.Sleep(parameters.WarehouseInterval)

	}
}
func loudMode(decision bool){
	printClient = decision
	printBoss = decision
	printWorker = decision
	printWarehouse = decision
}

func createProduct(task Task) int {
	var result int
	switch task.operation {
	case 0:
		result = task.A + task.B
	case 1:
		result = task.A - task.B
	case 2:
		result = task.A * task.B
	}
	return result
}

func menu() {
	var silentMode bool
	var input int
	fmt.Println("Welcome to GoCompany. [1] Silent mode [2] Loud mode [0] exit")
	fmt.Scanln(&input)
	switch input {
	case 1:
		loudMode(false)
		silentMode=true

	case 2:
		loudMode(true)
		silentMode=false

	case 0:
		os.Exit(0)
	}
	for {
		if(silentMode){
			loudMode(false)
			fmt.Println("[SILENT MODE] [1] - boss info [2] - workers info [3] - clients info [4] - warehouse info [0] - exit. [others] - Loud mode ")
			input =1
			for(input<5 ) {
				fmt.Scanln(&input)

				switch input {
				case 1:
					printBoss = !printBoss
				case 2:
					printWorker = !printWorker
				case 3:
					printClient = !printClient
				case 4:
					printWarehouse = !printWarehouse
				case 0:
					os.Exit(1)
				default:
					silentMode = false

				}
			}
		} else {
			loudMode(true)
			fmt.Println("[LOUD MODE] For exit press [0]. Any other button will turn on silent mode")
			fmt.Scanln(&input)
			switch input {
			case 0: os.Exit(0)
			default:
			silentMode = true
				}
		}
	}
}

