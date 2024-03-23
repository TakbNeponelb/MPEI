using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IndividualWork
{

    public partial class Form1 : Form
    {
        //Создание всех объектов класса для запуска программы
        Sphere economic = new Sphere();
        Accident economicalSphere1;
        Accident economicalSphere2;
        Accident economicalSphere3;
        Accident economicalSphere4;
        List<Accident> listEconomical = new List<Accident>();
        Ministr economicalMinistr;

        Sphere military = new Sphere();
        Accident militarySphere1;
        Accident militarySphere2;
        Accident militarySphere3;
        Accident militarySphere4;
        List<Accident> listMilitary = new List<Accident>();
        Ministr militaryMinistr;

        Sphere social = new Sphere();
        Accident socialSphere1;
        Accident socialSphere2;
        Accident socialSphere3;
        Accident socialSphere4;
        List<Accident> listSocial = new List<Accident>();
        Ministr socialMinistr;

        Sphere ecological = new Sphere();
        Accident ecologicalSphere1;
        Accident ecologicalSphere2;
        Accident ecologicalSphere3;
        Accident ecologicalSphere4;
        List<Accident> listEcological = new List<Accident>();
            Ministr ecologicalMinistr;

        Country country;
        Parlament parlament;

        Accident presidentSphere1;
        Accident presidentSphere2;
        Accident presidentSphere3;
        Accident presidentSphere4;
        List<Accident> listPresidetn = new List<Accident>();
        President president;

        List<int> massiv = new List<int>();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e) //Инициализация объектов классов при создании формы
        {
            economic = new Sphere();
            int[,] ecns1 = { { 10, 0, -5, 0 }, { -10, 0, 5, 0 }, { 10, 0, 0, 0 } };
            economicalSphere1 = new Accident("Благосостояние народа улучшилось, предлагаю немного поднять налоги.", ecns1);
            int[,] ecns2 = { { 25, 0, 0, 0 }, { 0, 10, 10, 10 }, { 0, 0, 0, 0 } };
            economicalSphere2 = new Accident("Дела налаживаются, войны заканчиваются, предлагаю отложить деньги на потом.", ecns2);
            int[,] ecns3 = { { 10, 0, 0, -5 }, { 25, 0, 0, 0 }, { 20, 0, 0, 0 } };
            economicalSphere3 = new Accident("Было найдено большое месторождение нефти. Предлагаю построить больше заводов по ее переработке.", ecns3);
            int[,] ecns4 = { { -10, 0, 10, 0 }, { 5, 0, -10, 0 }, { 10, 0, 10, 0 } };
            economicalSphere4 = new Accident("Благосостояние народа ухудшается, нужно ввести пособия для малоимущих.", ecns4);
            listEconomical.Add(economicalSphere1);
            listEconomical.Add(economicalSphere2);
            listEconomical.Add(economicalSphere3);
            listEconomical.Add(economicalSphere4);
            economicalMinistr = new Ministr(listEconomical, "экономической сферы, Петр Древов: ");

            military = new Sphere();
            int[,] ms1 = { { 0, -20, -10, 0 }, { 0, 5, 5, 0 }, { 0, 0, 0, 0 } };
            militarySphere1 = new Accident("Соседние страны инвестируют в вооружение. Нанесем превентный удар!", ms1);
            int[,] ms2 = { { -5, 10, 0, 0 }, { 0, -10, 5, 0 }, { 0, 0, 10, 0 } };
            militarySphere2 = new Accident("У нас маленькая и слабая армия. Нам нужны новобранцы.", ms2);
            int[,] ms3 = { { 0, 0, 0, -100 }, { 0, -10, 5, 0 }, { 0, 0, 0, 0 } };
            militarySphere3 = new Accident("Я хочу протестировать новое биологическое оружие, но глава исследовательского отдела против, но с вашим разрешением он позволит его испытать.", ms3);
            int[,] ms4 = { { -10, 20, 0, 0 }, { 5, -10, 0, 0 }, { 5, 0, 10, 0 } };
            militarySphere4 = new Accident("Отдел исследований не справляется с работой. Им нужно больше ресурсов для разработки оружия!", ms4);
            listMilitary.Add(militarySphere1);
            listMilitary.Add(militarySphere2);
            listMilitary.Add(militarySphere3);
            listMilitary.Add(militarySphere4);
            militaryMinistr = new Ministr(listMilitary, "военный сферы, Эльдо Туров: ");

            social = new Sphere();
            int[,] ss1 = { { -5, 0, 10, 0 }, { -5, 0, -5, 0 }, { 0, 0, 5, 0 } };
            socialSphere1 = new Accident("Люди несчастливы, они требуют больше развлечений!", ss1);
            int[,] ss2 = { { -5, 0, 10, 0 }, { 5, 0, -5, 0 }, { 0, 0, 10, 0 } };
            socialSphere2 = new Accident("Некоторые законы устарели. Нужно их пересмотреть.", ss2);
            int[,] ss3 = { { -10, 0, 10, 5 }, { 5, 0, -10, 0 }, { 5, 0, 10, 0 } };
            socialSphere3 = new Accident("Хотелось бы, чтобы государство лучше финансировало образование.", ss3);
            int[,] ss4 = { { -10, 0, 10, 0 }, { 5, 0, -20, 0 }, { 5, 0, 10, 0 } };
            socialSphere4 = new Accident("Люди на заводах отказываются работать и требуют повышение.", ss4);
            listSocial.Add(socialSphere1);
            listSocial.Add(socialSphere2);
            listSocial.Add(socialSphere3);
            listSocial.Add(socialSphere4);
            socialMinistr = new Ministr(listSocial, "социальный сферы, Александр Строгов: ");

             ecological = new Sphere();
            int[,] ecls1 = { { -10, 0, 5, 10 }, { 5, 0, -5, -10 }, { 0, 0, 0, 10 } };
            ecologicalSphere1 = new Accident("Соседние страны инвестируют в экологию, нам стоит поступить также.", ecls1);
            int[,] ecls2 = { { -5, 0, 5, 10 }, { 10, 0, -5, -20 }, { 0, 0, 0, 10 } };
            ecologicalSphere2 = new Accident("Было обнаружено, что одна влиятельная компания сливает токсичные отходы в реку. Надо с этим разобраться!", ecls2);
            int[,] ecls3 = { { -10, 0, 0, 10 }, { 5, 0, 0, -10 }, { 0, 0, 0, 10 } };
            ecologicalSphere3 = new Accident("Новая болезнь у животных поставила под угрозу животноводство. Многие фермы испытывают неудобство. Закрыть их на карантин?", ecls3);
            int[,] ecls4 = { { -10, -10, 10, 10 }, { 5, 0, -10, -10 }, { 0, 0, 0, 10 } };
            ecologicalSphere4 = new Accident("В некоторых городах продают продукты выращенные на зараженных территориях. Это очень опасно!", ecls4);
            listEcological.Add(ecologicalSphere1);
            listEcological.Add(ecologicalSphere2);
            listEcological.Add(ecologicalSphere3);
            listEcological.Add(ecologicalSphere4);
             ecologicalMinistr = new Ministr(listEcological, "экологической сферы, Николай Грязнов: ");

             country = new Country(economic, military, social, ecological, "Московия");
             parlament = new Parlament(economic, military, social, ecological, "Московия", economicalMinistr, militaryMinistr, socialMinistr, ecologicalMinistr);

            int[,] pres1 = { { -10, 5, 5, 5 }, { 10, 0, 0, 0 }, { 0, 0, 0, 0 } };
            presidentSphere1 = new Accident(". На этой неделе у вас день рождение, стоит ли праздновать?", pres1);
            int[,] pres2 = { { 0, -30, -30, 0 }, { 0, 10, 10, 0 }, { 0, 0, 0, 0 } };
            presidentSphere2 = new Accident(". Садовник с вашей дачи попросился в генералы, сказал что в школе был старостой, назначить его в генералы?", pres2);
            int[,] pres3 = { { -10, -5, -5, 0 }, { 5, 0, -30, 0 }, { 0, 0, 0, 0 } };
            presidentSphere3 = new Accident(". В северных регионах страны произошло землетрясение, направить туда спасательные отряды?", pres3);
            int[,] pres4 = { { 0, 0, -100, 0 }, { 0, 5, 5, 0 }, { 0, 0, 0, 0 } };
            presidentSphere4 = new Accident(". Вам пришло анонимное письмо с угрозами и требованием вашей отставки. Уйти с поста президента?", pres4);
            listPresidetn.Add(presidentSphere1);
            listPresidetn.Add(presidentSphere2);
            listPresidetn.Add(presidentSphere3);
            listPresidetn.Add(presidentSphere4);
            president = new President(listPresidetn, parlament, "В. В. Прутин");
            for (int i = 0; i < 20; i++) 
            {
                massiv.Add(i);
            }
            updateProgressBar();
        }

        private void updateProgressBar() //Обновление ProgressBar'ов и проверка выхода значения полей за границы
        {
            parlament.economicalSphere.outOfRange();
            progressBar1.Value = parlament.economicalSphere.count;
            progressBar5.Value = parlament.economicalSphere.effefficiency;
            parlament.militarySphere.outOfRange();
            progressBar2.Value = parlament.militarySphere.count;
            progressBar6.Value = parlament.militarySphere.effefficiency;
            parlament.socialSphere.outOfRange();
            progressBar3.Value = parlament.socialSphere.count;
            progressBar7.Value = parlament.socialSphere.effefficiency;
            parlament.ecologicalSphere.outOfRange();
            progressBar4.Value = parlament.ecologicalSphere.count;
            progressBar8.Value = parlament.ecologicalSphere.effefficiency;
            isOut();
        }
        private void isOut()//Проверка выхода значений полей за границы и сообщения соответствующие выходу значения опреденной сферы.
        {
            if (parlament.economicalSphere.endGame())//При выходе значний экономической сферы
            {
                MessageBox.Show(
     "Вашу голову продали лидерам других стран из-за ваших многочисленных долгов!",
     "Сообщение президенту",
     MessageBoxButtons.OK,
     MessageBoxIcon.Error);
                this.Close();
            }
            if (parlament.militarySphere.endGame())//При выходе значний военной сферы
            {
                MessageBox.Show(
     "На вас напали враги, через неделю вас и генерала окружили враги, бежать некуда!",
     "Сообщение президенту",
     MessageBoxButtons.OK,
     MessageBoxIcon.Error);
                this.Close();
            }
            if (parlament.socialSphere.endGame())//При выходе значний социальной сферы
            {
                MessageBox.Show(
     "Народ, недовольный вашими решениями, вышел на улицу и штурмует белый дом. После успешнего переворота Наковальный приходит к власти и ведет государственные дела под командованием Госдепа.",
     "Сообщение президенту",
     MessageBoxButtons.OK,
     MessageBoxIcon.Error);
                this.Close();
            }
            if (parlament.ecologicalSphere.endGame())//При выходе значний экологической сферы
            {
                MessageBox.Show(
     "Вся территория заражена, жить негде, вся страна обречена на мучительную смерть!",
     "Сообщение президенту",
     MessageBoxButtons.OK,
     MessageBoxIcon.Error);
                this.Close();
            }
        }
    private void button1_Click(object sender, EventArgs e)//Решение проблем в гос. сферах и вывод сообщение при полном из решении
        {
            if (massiv.Count == 0)
            {//вывод сообщение при полном из решении
                MessageBox.Show(
                    "Вы решили большинство проблем страны и удержали в ней власть, отныне дела будут налаживаться и вы приведете страну к процветанию",
                    "Поздравление о победе",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information
                    );
                Application.Exit();
            }
            else
            {//Решение проблем в гос. сферах
                Random rand = new Random();//выбор случайного числа для уникальных проблем сферы
                int buff = rand.Next(massiv.Count);
                president.offer(massiv[buff]);
                massiv.RemoveAt(buff);
                updateProgressBar();
            }
        }

        private void button2_Click(object sender, EventArgs e)//Распределение бюджета между сферами
        {
            int [] massiv = new int [3];
            massiv[0] = comboBox1.SelectedIndex;//1-я сфера
            massiv[1] = comboBox2.SelectedIndex;//2-я сфера
            massiv[2] = Convert.ToInt32(numericUpDown1.Value);//Значение, на которое будем менять
            president.ruling(massiv);//Изменение
            updateProgressBar();
            comboBox1.SelectedIndex = -1;//Обновление элементов формы
            comboBox2.SelectedIndex = -1;
            numericUpDown1.Value = 0;
        }
        private void button3_Click(object sender, EventArgs e)//Инвестирование в сферы
        {
            int[] massiv = new int[4];
            massiv[0] = comboBox3.SelectedIndex;//1-я сфера
            massiv[1] = comboBox4.SelectedIndex;//2-я сфера
            massiv[2] = Convert.ToInt32(numericUpDown2.Value);//Значение показателя, на которое будем менять
            massiv[3] = Convert.ToInt32(numericUpDown3.Value);//Значение коэффициента, на которое будем менять
            country.ruling(massiv);
            updateProgressBar();
            comboBox3.SelectedIndex = -1;//Обновление элементов формы
            comboBox4.SelectedIndex = -1;
            numericUpDown2.Value = 0;
            numericUpDown3.Value = 0;
        }

        private void button4_Click(object sender, EventArgs e)//Создание резерва для выбранной сферы
        {
            switch (comboBox5.SelectedIndex) 
            {
                case 0:
                    economic.setReserve();
                    break;
                case 1:
                    military.setReserve();
                    break;
                case 2:
                    social.setReserve();
                    break;
                case 3:
                    ecological.setReserve();
                    break;
            }
            updateProgressBar();
        }
        private void button5_Click(object sender, EventArgs e)//Забрать резерв выбранной формы
        {
            switch (comboBox5.SelectedIndex)
            {
                case 0:
                    economic.getReserve();
                    break;
                case 1:
                    military.getReserve();
                    break;
                case 2:
                    social.getReserve();
                    break;
                case 3:
                    ecological.getReserve();
                    break;
            }
            updateProgressBar();
        }
    }
}
