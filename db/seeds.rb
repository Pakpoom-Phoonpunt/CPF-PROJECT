factory = Factory.create(name:"CPF")
department1 = Department.create(name:"KFC", factory_id: factory.id)
department2 = Department.create(name:"CFK", factory_id: factory.id)

user= Account.create(name: "แอดมิน", username: "manager", password: "1", factory_id: factory.id, role: "Manager")

user2= Account.create(name: "ผู้จัดการ1", username: "admin", password: "1", factory_id: factory.id, role: "Admin")

user3= Account.create(name: "พนักงาน1 ข้อมูลตัวอย่าง", username: "Worker1", password: "1", factory_id: factory.id, role: "Worker", free: true)
user4= Account.create(name: "พนักงาน2 ข้อมูลตัวอย่าง", username: "Worker2", password: "1", factory_id: factory.id, role: "Worker", free: true)
user5= Account.create(name: "พนักงาน3 ข้อมูลตัวอย่าง", username: "Worker3", password: "1", factory_id: factory.id, role: "Worker", free: true)
user6= Account.create(name: "พนักงาน4 ข้อมูลตัวอย่าง", username: "Worker4", password: "1", factory_id: factory.id, role: "Worker", free: true)
user7= Account.create(name: "พนักงาน5 ข้อมูลตัวอย่าง", username: "Worker5", password: "1", factory_id: factory.id, role: "Woker", free: true)
user8= Account.create(name: "พนักงาน6 ข้อมูลตัวอย่าง", username: "Worker6", password: "1", factory_id: factory.id, role: "Worker", free: true)
user9= Account.create(name: "พนักงาน7 ข้อมูลตัวอย่าง", username: "Worker7", password: "1", factory_id: factory.id, role: "Worker", free: true)
user10= Account.create(name: "พนักงาน8 ข้อมูลตัวอย่าง", username: "Worker8", password: "1", factory_id: factory.id, role: "Worker", free: true)
user11= Account.create(name: "พนักงาน9 ข้อมูลตัวอย่าง", username: "Worker9", password: "1", factory_id: factory.id, role: "Worker", free: true)
user12= Account.create(name: "พนักงาน10 ข้อมูลตัวอย่าง", username: "Worker10", password: "1", factory_id: factory.id, role: "Worker", free: true)

user13= Account.create(name: "สมชาย ร้อยเสน่ห์ ", username: "Worker11", password: "1", factory_id: factory.id, role: "Worker", free: true)
user14= Account.create(name: "มหาเวทย์ ผนึกมาร ", username: "Worker12", password: "1", factory_id: factory.id, role: "Worker", free: true)
user15= Account.create(name: "จัตุรงค์ บรรจงยิง", username: "Worker13", password: "1", factory_id: factory.id, role: "Woker", free: true)
user16= Account.create(name: "รรรรร เทพจริง ", username: "Worker14", password: "1", factory_id: factory.id, role: "Worker", free: true)
user17= Account.create(name: "มหาหล่อ บางกระดี้ดี ", username: "Worker15", password: "1", factory_id: factory.id, role: "Worker", free: true)
user18= Account.create(name: "เฟรนส์ โซนส์ ", username: "Worker16", password: "1", factory_id: factory.id, role: "Worker", free: true)
user19= Account.create(name: "มานะ หนึ่งเดียว  ", username: "Worker17", password: "1", factory_id: factory.id, role: "Worker", free: true)
user20= Account.create(name: "มานะ ใจสลาย  ", username: "Worker18", password: "1", factory_id: factory.id, role: "Worker", free: true)







task1 = Task.create(account_id: user3.id, department_id: department1.id, day: Time.parse('17-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)
task1 = Task.create(account_id: user3.id, department_id: department1.id, day: Time.parse('18-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)
task1 = Task.create(account_id: user3.id, department_id: department1.id, day: Time.parse('19-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)
task1 = Task.create(account_id: user3.id, department_id: department1.id, day: Time.parse('20-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)

task2 = Task.create(account_id: user3.id, department_id: department2.id, day: Time.parse('17-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)
task2 = Task.create(account_id: user3.id, department_id: department2.id, day: Time.parse('18-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)
task2 = Task.create(account_id: user3.id, department_id: department2.id, day: Time.parse('19-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)
task2 = Task.create(account_id: user3.id, department_id: department2.id, day: Time.parse('20-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)

task3 = Task.create(account_id: user5.id, department_id: department1.id, day: Time.parse('17-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)
task3 = Task.create(account_id: user5.id, department_id: department1.id, day: Time.parse('18-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)
task3 = Task.create(account_id: user5.id, department_id: department1.id, day: Time.parse('19-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)
task3 = Task.create(account_id: user5.id, department_id: department1.id, day: Time.parse('20-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: true)

task4 = Task.create(account_id: user6.id, department_id: department2.id, day: Time.parse('17-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)
task4 = Task.create(account_id: user6.id, department_id: department2.id, day: Time.parse('18-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)
task4 = Task.create(account_id: user6.id, department_id: department2.id, day: Time.parse('19-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)
task4 = Task.create(account_id: user6.id, department_id: department2.id, day: Time.parse('20-11-2021'), shift: "1", ot: 2, startTime: Time.now, active: false)

task5 = Task.create(account_id: user7.id, department_id: department1.id, day: Time.parse('18-11-2021'), shift: "1", ot: 4, startTime: Time.now, active: true)
task6 = Task.create(account_id: user8.id, department_id: department2.id, day: Time.parse('18-11-2021'), shift: "1", ot: 4, startTime: Time.now, active: false)
task7 = Task.create(account_id: user9.id, department_id: department1.id, day: Time.parse('19-11-2021'), shift: "1", ot: 4, startTime: Time.now, active: true)
task8 = Task.create(account_id: user10.id, department_id: department2.id, day: Time.parse('19-11-2021'), shift: "1", ot: 4, startTime: Time.now, active: false)

task9 = Task.create(account_id: user11.id, department_id: department1.id, day: Time.parse('25-11-2021'), shift: "2", ot: 2, startTime: Time.now, active: true)
task10 = Task.create(account_id: user12.id, department_id: department1.id, day: Time.parse('25-11-2021'), shift: "2", ot: 2, startTime: Time.now, active: false)
task11 = Task.create(account_id: user13.id, department_id: department2.id, day: Time.parse('21-11-2021'), shift: "2", ot: 2, startTime: Time.now, active: true)
task12 = Task.create(account_id: user14.id, department_id: department2.id, day: Time.parse('21-11-2021'), shift: "2", ot: 2, startTime: Time.now, active: false)

task13 = Task.create(account_id: user15.id, department_id: department1.id, day: Time.parse('1-11-2021'), shift: "2", ot: 0, startTime: Time.now, active: true)
task14 = Task.create(account_id: user16.id, department_id: department1.id, day: Time.parse('2-11-2021'), shift: "2", ot: 0, startTime: Time.now, active: false)
task15 = Task.create(account_id: user17.id, department_id: department2.id, day: Time.parse('3-11-2021'), shift: "2", ot: 0, startTime: Time.now, active: true)
task16 = Task.create(account_id: user18.id, department_id: department2.id, day: Time.parse('4-11-2021'), shift: "2", ot: 0, startTime: Time.now, active: false)
