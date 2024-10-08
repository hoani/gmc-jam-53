{
  "$GMObject":"",
  "%Name":"obj_circle",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":{"name":"obj_base","path":"objects/obj_base/obj_base.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":{"name":"obj_joinable_base","path":"objects/obj_joinable_base/obj_joinable_base.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_circle",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_joinable","path":"objects/obj_joinable/obj_joinable.yy",},"propertyId":{"name":"get_join","path":"objects/obj_joinable/obj_joinable.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"get_join_circle",},
  ],
  "parent":{
    "name":"material",
    "path":"folders/Objects/physics/material.yy",
  },
  "parentObjectId":{
    "name":"obj_joinable_base",
    "path":"objects/obj_joinable_base/obj_joinable_base.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.8,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[
    {"x":0.0,"y":0.0,},
    {"x":32.0,"y":0.0,},
    {"x":32.0,"y":32.0,},
    {"x":0.0,"y":32.0,},
  ],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"radius","filters":[],"listItems":[],"multiselect":false,"name":"radius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"16","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"material","filters":[],"listItems":[],"multiselect":false,"name":"material","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"MATERIAL_BALL","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_circle",
    "path":"sprites/spr_circle/spr_circle.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}