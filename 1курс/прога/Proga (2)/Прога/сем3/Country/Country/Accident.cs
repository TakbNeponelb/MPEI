using System;
using System.Collections.Generic;
using System.Text;

namespace IndividualWork
{
    class Accident
    {
        public Accident(string situation, int [,]counts) 
        {
            this.situation = situation;
            this.counts = counts;
        }
        public int [,] counts = new int[3,4];
        public string situation;
    }
}
