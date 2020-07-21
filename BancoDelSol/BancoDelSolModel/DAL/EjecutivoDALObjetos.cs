using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DAL
{
    public class EjecutivoDALObjetos : IEjecutivoDAL
    {
        private static List<Ejecutivo> ejecutivos = new List<Ejecutivo>();

        public void Agregar(Ejecutivo ejecutivo)
        {
            ejecutivos.Add(ejecutivo);
        }

        public List<Ejecutivo> Obtener()
        {
            return ejecutivos;
        }
    }
}
