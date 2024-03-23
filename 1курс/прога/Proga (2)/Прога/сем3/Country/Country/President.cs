using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace IndividualWork
{
    class President:Ministr, Ruling
    {
        Parlament parlament;
        public President(List<Accident> list, Parlament parlament, string fio) : base(list, fio) 
        {
            this.parlament = parlament;
        }
        public override string greeting()//Представление президента
        {
            return "Президент государства " + parlament.nameOfCountry;
        }
        public void ruling(int [] massiv) //Управление странной (изменение полей сферы)
        {
            switch (massiv[0]) 
            {
                case 0:
                    parlament.economicalSphere.count -= massiv[2];
                    break;
                case 1:
                    parlament.militarySphere.count -= massiv[2];
                    break;
                case 2:
                    parlament.socialSphere.count -= massiv[2];
                    break;
                case 3:
                    parlament.ecologicalSphere.count -= massiv[2];
                    break;
            }
            switch (massiv[1])
            {
                case 0:
                    parlament.economicalSphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2])*0.9);
                    break;
                case 1:
                    parlament.militarySphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.9);
                    break;
                case 2:
                    parlament.socialSphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.9);
                    break;
                case 3:
                    parlament.ecologicalSphere.count += Convert.ToInt32(Convert.ToDouble(massiv[2]) * 0.9);
                    break;
            }


        }
        public void offer(int num)//Создание обращение к презеденту в связи с проблемой
        {
            switch (num / 4) {
                case 0://Обращение министра экономики
                    if (MessageBox.Show(
        parlament.economicalMinistr.greeting() + parlament.economicalMinistr.list[num % 4].situation,
        "Предложение президенту",
        MessageBoxButtons.YesNo,
        MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        parlament.changeCountSphere(parlament.economicalMinistr.list[num % 4].counts, 0);
                    }
                    else
                    {
                        parlament.changeCountSphere(parlament.economicalMinistr.list[num % 4].counts, 1);
                    }
                    break;
                case 1://Обращение военного министра
                    if (MessageBox.Show(
     parlament.militaryMinistr.greeting() + parlament.militaryMinistr.list[num % 4].situation,
     "Предложение президенту",
     MessageBoxButtons.YesNo,
     MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        parlament.changeCountSphere(parlament.militaryMinistr.list[num % 4].counts, 0);
                    }
                    else
                    {
                        parlament.changeCountSphere(parlament.militaryMinistr.list[num % 4].counts, 1);
                    }
                    break;
                case 2://Обращение социального министра
                    if (MessageBox.Show(
     parlament.socialMinistr.greeting() + parlament.socialMinistr.list[num % 4].situation,
     "Предложение президенту",
     MessageBoxButtons.YesNo,
     MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        parlament.changeCountSphere(parlament.socialMinistr.list[num % 4].counts, 0);
                    }
                    else
                    {
                        parlament.changeCountSphere(parlament.socialMinistr.list[num % 4].counts, 1);
                    }
                    break;
                case 3://Обращение экологического министра
                    if (MessageBox.Show(
     parlament.ecologicalMinistr.greeting() + parlament.ecologicalMinistr.list[num % 4].situation,
     "Предложение президенту",
     MessageBoxButtons.YesNo,
     MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        parlament.changeCountSphere(parlament.ecologicalMinistr.list[num % 4].counts, 0);
                    }
                    else
                    {
                        parlament.changeCountSphere(parlament.ecologicalMinistr.list[num % 4].counts, 1);
                    }
                    break;
                case 4://Решение собственных проблем
                    if (MessageBox.Show(
     greeting() + list[num % 4].situation,
     "Предложение президенту",
     MessageBoxButtons.YesNo,
     MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        parlament.changeCountSphere(list[num % 4].counts, 0);
                    }
                    else
                    {
                        parlament.changeCountSphere(list[num % 4].counts, 1);
                    }
                    break;
            }
        }
    }
}
