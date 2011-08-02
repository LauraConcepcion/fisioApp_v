# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :paciente do |paciente|
  paciente.name "laura"
  paciente.firstsurname "concepcin"
  paciente.secondsurname  "rodrguez"
  paciente.idcode "42192561G"
  paciente.email "a@a.com"
end