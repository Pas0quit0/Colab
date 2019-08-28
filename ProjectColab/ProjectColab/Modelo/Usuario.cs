﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Usuario
    {
        public int id { get; set; }
        public string nome { get; set; }
        public string login{ get; set; }
        public string senha{ get; set; }
        public int tipo { get; set; }
        public string foto_url { get; set; }




        public Usuario()
        {
            id = 0;
            nome = "";
            login = "";
            senha = "";
            tipo = "";
            foto_url = "";
        }

        public Usuario(int id, string name, string login, string senha, int tipo, string foto_url)
        {
            this.id = id;
            this.nome = name;
            this.login = login;
            this.senha = senha;
            this.tipo = tipo;
            this.foto_url = foto_url;
        }
    }
}