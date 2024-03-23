using System;
using System.Collections.Generic;
using System.Text;

namespace IndividualWork
{
    class Sphere
    {
        private int _count;
        public int count { get { return _count; } set { _count = value; } }
        private int _effefficiency;
        public int effefficiency { get { return _effefficiency; } set { _effefficiency = value; } }
        public Sphere()
        {
            count = 50;
            effefficiency = 100;
            reserve = false;
        }
        private bool reserve;
        public void setReserve()//Создать резерв
        {
                if (!reserve && (count > 50))
                {
                    reserve = true;
                    count -= 25;
                    effefficiency += 10;
                }
        }
        public void getReserve()//Отдать резерв
        {
            if (reserve)
            {
                reserve = false;
                count += 25;
                effefficiency -= 10;
            }
        }
        public bool endGame()//Проверка на выход полей за границы
        {
            if (count == 0 || effefficiency == 0)
                return true;
            return false;
        }
        public void outOfRange()//Изменение значений сферы при их выходе за пределы
        {
            if (count < 0)
            {
                count = 0;
            }
            else if (count > 100)
            {
                count = 100;
            }
            if (effefficiency < 0)
                effefficiency = 0;
            else if (effefficiency > 400)
                effefficiency = 400;
        }
    }
}
