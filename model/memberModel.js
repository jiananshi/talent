/**
 * Created by apple on 2015/4/20.
 */
module.exports = function(id,name){
   var  member= {
        id: 0,
        name :""
    }
    member.id = id;
    member.name = name;

    return member;
}