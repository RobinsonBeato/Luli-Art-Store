import { Nav, NavLink } from "@/components/Nav";

export default function AdminLayout({
    children,
  }: Readonly<{
    children: React.ReactNode;
  }>) {
    return (
      < >
       <div className="bg-gray-200 pt-3 pb-3 flex items-center justify-between">
                {/* Logo a la izquierda */}
          <div className="flex items-center">
            <img src="/favicon.ico" alt="Logo" className="pl-2 h-12 w-auto" />
          </div>
          <div className="flex-1 flex justify-center">
            <h1 className="text-2xl font-bold">Panel de Administración</h1>
          </div>
          <div className="w-12"></div>
       </div>
       <Nav>
        
         <NavLink href="/admin">Panel</NavLink>
         <NavLink href="/admin/products">Productos</NavLink>
         <NavLink href="/admin/users">Clientes</NavLink>
         <NavLink href="/admin/orders">Ventas</NavLink>
       </Nav>
       <div className="container my-6">{children}</div>
      </>
    );
  }