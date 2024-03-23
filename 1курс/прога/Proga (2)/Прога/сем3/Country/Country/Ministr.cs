using System;
using System.Collections.Generic;
using System.Text;

namespace IndividualWork
{
    class Ministr : Person
    {
        public Ministr(List<Accident> list, string fio):base(fio) {
            this.list = list;
        }
        public override string greeting() {//Представление министра
            return "Министр " + fio;
        }
        public List<Accident> list;
    }
}
