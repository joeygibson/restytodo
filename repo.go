package main

import "fmt"

var currentId int
var todos Todos

func init() {
	RepoCreateTodo(Todo{Name: "Write presentation"})
	RepoCreateTodo(Todo{Name: "Host meetup"})
}

func RepoFindTodo(id int) Todo {
	for _, t := range todos {
		if t.ID == id {
			return t
		}
	}

	// return empty if none found
	return Todo{}
}

func RepoCreateTodo(t Todo) Todo {
	currentId += 1
	t.ID = currentId
	todos = append(todos, t)

	return t
}

func RepoDestroyTodo(id int) error {
	for i, t := range todos {
		if t.ID == id {
			todos = append(todos[:i], todos[i+1:]...)

			return nil
		}
	}

	return fmt.Errorf("Could not find todo: %d", id)
}
