using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DAL
{
    public interface ICuentaDAL
    {
        List<Cuenta> Obtener();
        void Agregar(Cuenta cliente);
        void Eliminar(Cuenta c);
        List<Cuenta> Cuentasfiltradas(String run);
    }
}
