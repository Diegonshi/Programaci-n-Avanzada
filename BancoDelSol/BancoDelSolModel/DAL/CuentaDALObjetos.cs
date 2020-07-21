using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DAL
{
    public class CuentaDALObjetos : ICuentaDAL
    {
        private static List<Cuenta> cuentas = new List<Cuenta>();
        private IClienteDAL clienteDAL = new ClienteDALObjetos();

        //Metodos

        public void Eliminar(Cuenta c)
        {
            cuentas.Remove(c);
        }

        public List<Cuenta> Obtener()
        {
            return cuentas;
        }

        public void Agregar(Cuenta c)
        {
            cuentas.Add(c);
        }

        public List<Cuenta> Cuentasfiltradas(String run)
        {
            List<Cuenta> allCuentas = this.Obtener(); 
            List<Cuenta> listaCuentas = new List<Cuenta>();

            listaCuentas = allCuentas.FindAll(x => x.CuentaHabiente.Run == run );

            return listaCuentas;
        }

    }
}
