using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class OkPneuTire
    {
        private string _name;
        private uint _nakupnicena;
        private string _description;
        private string _season;
        public string code { get; set; }
        public int Sirka
        {
            get;

            set;

        }

        public int Vyska
        {
            get;

            set;

        }

        public int Prumer
        {
            get;

            set;

        }

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
                Detail = MakeDetail(value);
                Sirka = MakeSirka(Detail.ToString());
                Vyska = MakeVyska(Detail.ToString());
                Prumer = MakePrumer(Detail.ToString());
            }
        }

        public int Detail
        {
            get;

            set;

        }

        public string EAN
        {
            get;

            set;

        }

        public int OnStore
        {
            get;

            set;
        }
        public int ExternalStore { get; set; }
        public uint NakupniCena
        {
            get
            {
                return _nakupnicena;
            }

            set
            {
                _nakupnicena = value;
                this.ProdejniCena = (decimal)(value * 1.1);
            }

        }

        public decimal ProdejniCena
        {
            get;

            set;

        }

        public string Manufacturer
        {
            get;

            set;

        }

        public string Season
        {
            get
            {
                return _season;
            }
            set
            {
                if (value == "zimní") _season = "Z";
                else if (value == "letní") _season = "L";
                else _season = "D";
            }

        }

        public string Description
        {
            get
            {
                return _description;
            }

            set
            {
                if (value.Length < 255)
                    _description = value;
                else _description = value.Substring(0, 255);
            }

        }

        public string ImageURL
        {
            get;

            set;

        }
        public override string ToString()
        {
            return "Jmeno " + _name;
        }
        private static int MakeDetail(string imput)
        {
            int strlenght = imput.Length;
            char[] tmp = new char[7]; char[] sirkach = new char[3]; char[] vyskach = new char[2]; char[] prumerch = new char[2]; int count = 0;
            for (int i = 0; i < strlenght; i++)
            {
                if (Char.IsNumber(imput, i) && count < 7)
                {
                    tmp[count] = imput[i];
                    count++;
                }
            }
            count = 0;
            for (int i = 0; i < 3; i++) { sirkach[i] = tmp[count]; count++; }
            for (int i = 0; i < 2; i++) { vyskach[i] = tmp[count]; count++; }
            for (int i = 0; i < 2; i++) { prumerch[i] = tmp[count]; count++; }
            string sirka = new string(sirkach);
            string vyska = new string(vyskach);
            string prumer = new string(prumerch);
            string rozmer = new string(tmp);
            //Console.WriteLine("{0}{1}{2}", sirka, vyska, prumer);
            int ret;
            Int32.TryParse(String.Format("{0}{1}{2}", sirka, vyska, prumer), out ret);
            return ret;
        }
        private static int MakeSirka(string size)
        {
            char[] tmp = new char[3];
            for (int i = 0; i < 3; i++) { tmp[i] = size[i]; }
            //string newsizestring = new string(tmp);
            int newsize = int.Parse(new string(tmp));
            return newsize;
        }
        private static int MakeVyska(string size)
        {
            char[] tmp = new char[2];
            for (int i = 0; i < 2; i++) { tmp[i] = size[i + 3]; }
            //string newsizestring = new string(tmp);
            int newsize = int.Parse(new string(tmp));
            return newsize;
        }
        private static int MakePrumer(string size)
        {
            char[] tmp = new char[2];
            for (int i = 0; i < 2; i++) { tmp[i] = size[i + 5]; }
            //string newsizestring = new string(tmp);
            int newsize = int.Parse(new string(tmp));
            return newsize;
        }
    }
}