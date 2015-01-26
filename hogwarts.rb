require 'sinatra'
require 'pry'

students ={
	0 => {
		id:0,
		name: "David",
		age: "32"
		favorite_spell: "apparating"
	}
}

counter = 1

get '/students' do
	erb :index, locals: {students: students}
end

get '/student/:id' do
	this_student = students[params[:id].to_i]
	erb :show, locals: {this_student: this_student}
end

put '/student/:id' do
	student=students[params[:id].to_i]
	student[:name] = params["newname"]
	redirect '/students'
end

post '/student' do
	newstudent = {
		id: counter,
		name: params["name"],
		type: params["type"]
	}
	students[counter] = newstudent
	counter += 1
	redirect '/students'

end

delete '/student/:id' do
	students.delete(params[:id].to_i)
	redirect '/students'
end