using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DTO
{
    public class Ejecutivo : Persona
    {
        private int cod_ejecutivo;
        private string passEjecutivo;
        private List<Cliente> clientes = new List<Cliente>();

     

        public Ejecutivo(string run, string nombre, string paterno, string materno, int telefono, string direccion, string passEjecutivo)
            : base(run, nombre, paterno, materno, telefono, direccion)
        {
            this.passEjecutivo = passEjecutivo;
        }


        public int Cod_ejecutivo { get => cod_ejecutivo; set => cod_ejecutivo = value; }
        public List<Cliente> Clientes { get => clientes; set => clientes = value; }
        public string Pass { get => passEjecutivo; set => passEjecutivo = value; }
    }
}

