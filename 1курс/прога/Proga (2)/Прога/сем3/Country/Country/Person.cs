using System;
using System.Collections.Generic;
using System.Text;

namespace IndividualWork
{
    abstract class Person
    {
        public Person(string fio) { this.fio = fio; }
        protected string fio;
        public abstract string greeting();
    }
}
