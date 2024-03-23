using System;
using System.Collections.Generic;
using System.Text;

namespace IndividualWork
{
    class Parlament: Country
    {
        public Ministr economicalMinistr;
        public Ministr militaryMinistr;
        public Ministr socialMinistr;
        public Ministr ecologicalMinistr;
        public Parlament(Sphere economicalSphere, Sphere militarySphere, Sphere socialSphere, Sphere ecologicalSphere, string nameOfCountry, Ministr economicalMinistr, Ministr militaryMinistr, Ministr socialMinistr, Ministr ecologicalMinistr): base(economicalSphere, militarySphere, socialSphere, ecologicalSphere, nameOfCountry) 
        {
            this.economicalMinistr = economicalMinistr;
            this.ecologicalMinistr = ecologicalMinistr;
            this.militaryMinistr = militaryMinistr;
            this.socialMinistr = socialMinistr;
        }
    }
}
