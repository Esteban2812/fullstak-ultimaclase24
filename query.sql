db.cursos.insertMany([
    {curso:"angualr",duracion:1,temas:20},
    {curso:"angualr2",duracion:2,temas:40},
    {curso:"angualr3",duracion:3,temas:10},
])

db.alumnos.insertMany([
    {nombre: "Pedro", apellido: "salinas", edad:23, curso: ObjectId("5c6b63efa33ccb6ef0a12d65")},
    {nombre: "elena", apellido: "quispe", edad:25, curso: ObjectId("5c6b63efa33ccb6ef0a12d65")},
    {nombre: "ariana", apellido: "quintanlla", edad:34, curso: ObjectId("5c6b63efa33ccb6ef0a12d65")},
    {nombre: "josefina", apellido: "bellido", edad:22, curso: ObjectId("5c6b63efa33ccb6ef0a12d64")},
    {nombre: "lucho", apellido: "salass", edad:33, curso: ObjectId("5c6b63efa33ccb6ef0a12d64")},
    {nombre: "pedro", apellido: "chavarry", edad:62, curso: ObjectId("5c6b63efa33ccb6ef0a12d63")},
    {nombre: "lucio", apellido: "pocastrancas", edad:33, curso: ObjectId("5c6b63efa33ccb6ef0a12d63")}
])


db.alumnos.aggregate(
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "infocurso"
        }
    }
).pretty()

db.alumnos.aggregate(
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id"
        }
    }
).pretty()

db.alumnos.aggregate(
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }
    }
).pretty()


db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
    {
    $project:{  nombre: 1, edad: 1, 
                "curso.curso":1,"curso.temas":1}
    }
]
).pretty()



db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
    {
    $project:{  nombre: 1, edad: 0, 
                "curso.curso":1,"curso.temas":1}
    }
]
).pretty()




db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
    {
    $project:{  _id: 0,
                nombre: 1, edad: 1, 
                "curso.curso":1,"curso.temas":1}
    }
]
).pretty()



db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
    {
    $project:{  _id: 0,
                nombre: 1, edad: 1, 
                "curso.curso":1,"curso.temas":1}
    },
    {
        $match:{
            edad: "40"
        }
    }
]
).pretty()



db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
    {
    $project:{  _id: 0,
                nombre: 1, edad: 1, 
                "curso.curso":1,"curso.temas":1}
    },
    {
        $match:{
            edad: {$gt:10}
        }
    }
]
).pretty()


db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $match:{
            edad: {$gt:30}
        }
     }
    ,
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()


db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
    {
    $project:{  _id: 0,
                nombre: 1, edad: 1, 
                "curso.curso":1,"curso.temas":1}
    },
    {
        $match:{
            edad: {$gt:10}
        }
    }
]
).pretty()

db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $match:{
            edad: {$lte:10}
        }
     }
    ,
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()



db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $match:{
            edad: {$eq:10}
        }
     }
    ,
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()


db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $match:{
            edad: {$ne:10}
        }
     }
    ,
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()



db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $match:{
            $and: [{edad:{$gte: 30}},
            {edad:{$lte: 50}}
            ]
            
        }
     }
    ,
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()



db.alumnos.aggregate([
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()

--traer los dos primeros


db.alumnos.aggregate([
    {
        $skip:2
    },
    {
        $limit:2
    },
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     
    {
    $project:{  _id: 0,
                nombre: 1, 
                "curso.curso":1,"curso.temas":1}
    }
   
]
).pretty()

actualizar andrea a la edad de lucio
db.alumnos.updateOne({nombre:"josefina"},{$set:{edad:33}})

db.alumnos.aggregate([
   
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $group: {
            _id:{edad:"$edad"},
            cuenta:{$sum: 1}
        }

     }
   
]
).pretty()



db.alumnos.aggregate([
   
    {
        $lookup:{
            from: "cursos",
            localField: "curso",
            foreignField: "_id",
            as: "curso"
        }        
    },
     {
        $match: {
            edad:33
            
        }

     }
   
]
).pretty()
