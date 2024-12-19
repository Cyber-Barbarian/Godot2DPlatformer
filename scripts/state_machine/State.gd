extends Node
 
class_name State 

# sinal emitido quando o estado termina
signal finished(next_state_path: String, data: Dictionary)

#chamada qquando recebeinputs
func handle_input(_event:InputEvent) -> void:
	pass

#update do estado
func update (_delta:float)-> void:
	pass

#update da física
func physics_update (_delta:float)-> void:
	pass

#entra no estado
func enter(previous_state_path: String, data := {}) -> void:
	pass

#limpa o estado antes de mudar
func exit() -> void:
	pass
