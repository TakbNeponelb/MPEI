using System;
using System.Collections.Generic;
using System.Text;

namespace IndividualWork
{
    class Country: Ruling
    {

        public Sphere economicalSphere { get { return _economicalSphere; } set { this._economicalSphere = value; } }
        public Sphere militarySphere { get { return _militarySphere; } set { this._militarySphere = value; } }
        public Sphere socialSphere { get { return _socialSphere; } set { this._socialSphere = value; } }
        public Sphere ecologicalSphere { get { return _ecologicalSphere; } set { this._ecologicalSphere = value; } }
        private Sphere _economicalSphere;
        private Sphere _militarySphere;
        private Sphere _socialSphere;
        private Sphere _ecologicalSphere;
        public string nameOfCountry;
        public Country(Sphere economicalSphere, Sphere militarySphere, Sphere socialSphere, Sphere ecologicalSphere, string nameOfCountry) 
        {
            this.economicalSphere = economicalSphere;
            this.ecologicalSphere = ecologicalSphere;
            this.socialSphere = socialSphere;
            this.militarySphere = militarySphere;
            this.nameOfCountry = nameOfCountry;
        }
        public void ruling(int[] massiv)
        {
            switch (massiv[0])
            {
                case 0:
                    economicalSphere.count -= massiv[2];
                    economicalSphere.effefficiency -= massiv[3];
                    break;
                case 1:
                    militarySphere.count -= massiv[2];
                    militarySphere.effefficiency -= massiv[3];
                    break;
                case 2:
                    socialSphere.count -= massiv[2];
                    socialSphere.effefficiency -= massiv[3];
                    break;
                case 3:
                    ecologicalSphere.count -= massiv[2];
                    ecologicalSphere.effefficiency -= massiv[3];
                    break;
            }
            switch (massiv[1])
            {
                case 0:
                    economicalSphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.8);
                    economicalSphere.effefficiency += Convert.ToInt32(Convert.ToDouble(massiv[3]) * 0.8);
                    break;
                case 1:
                    militarySphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.8);
                    militarySphere.effefficiency += Convert.ToInt32(Convert.ToDouble(massiv[3]) * 0.8);
                    break;
                case 2:
                    socialSphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.8);
                    socialSphere.effefficiency += Convert.ToInt32(Convert.ToDouble(massiv[3]) * 0.8);
                    break;
                case 3:
                    ecologicalSphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.8);
                    ecologicalSphere.effefficiency += Convert.ToInt32(Convert.ToDouble(massiv[3]) * 0.8);
                    break;
            }
        }
        public void changeCountSphere(int[,] massiv, int choice)//Изменение значений сферы в зависимости от выбора пользователя 0 - да, 1 - нет
        {
            if (choice==0)
                economicalSphere.effefficiency += massiv[2, 0];
            else
                economicalSphere.effefficiency -= massiv[2, 0];
            if (choice == 0)
                militarySphere.effefficiency += massiv[2, 1];
            else
                militarySphere.effefficiency -= massiv[2, 1];
            if (choice == 0)
                socialSphere.effefficiency += massiv[2, 2];
            else
                socialSphere.effefficiency -= massiv[2, 2];
            if (choice == 0)
                ecologicalSphere.effefficiency += massiv[2, 2];
            else
                ecologicalSphere.effefficiency -= massiv[2, 3];
            economicalSphere.count += Convert.ToInt32((Convert.ToDouble(massiv [choice, 0]) * Convert.ToDouble(economicalSphere.effefficiency))/100) ;
            militarySphere.count += Convert.ToInt32((Convert.ToDouble(massiv[choice, 1]) * Convert.ToDouble(militarySphere.effefficiency)) / 100);
            socialSphere.count += Convert.ToInt32((Convert.ToDouble(massiv[choice, 2]) * Convert.ToDouble(socialSphere.effefficiency)) / 100);
            ecologicalSphere.count += Convert.ToInt32((Convert.ToDouble(massiv[choice, 3]) * Convert.ToDouble(ecologicalSphere.effefficiency)) / 100);
        }
    }
}
