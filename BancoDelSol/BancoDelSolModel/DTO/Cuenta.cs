using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DTO
{
    public class Cuenta
    {
        private int num_cuenta;
        private Cliente cuentaHabiente;
        private int credito;
        private string clave;
        private int saldo;
        private List<Movimiento> movimientos = new List<Movimiento>();

        public Cuenta(/*int num_cuenta, Cliente cuentahabiente, int clave, int saldo*/)
        {
            this.credito = 10000;
        }

        public int Num_cuenta { get => num_cuenta; set => num_cuenta = value; }
        public int Credito { get => credito; set => credito = value; }
        public string Clave { get => clave; set => clave = value; }
        public int Saldo { get => saldo; set => saldo = value; }
        public Cliente CuentaHabiente { get => cuentaHabiente; set => cuentaHabiente = value; }
        public List<Movimiento> Movimientos { get => movimientos; set => movimientos = value; }

        /*public override string ToString()
        {
            return "Titular: " + this.cuentahabiente.Nombre + " " + this.cuentahabiente.Paterno + " -- " + "Nro cuenta: " + this.num_cuenta;
        }*/
    }
}
