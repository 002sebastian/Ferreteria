<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>{{ config('app.name','Ferreteria') }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  @vite(['resources/css/app.css','resources/js/app.js'])
<style>
  :root{
    --bg:#0f172a; --fg:#fff; --fg2:#e2e8f0; --accent:#2563eb;
    --line:#e5e7eb; --muted:#64748b;
  }
  *{box-sizing:border-box}
  body{font-family:system-ui,Segoe UI,Roboto,Arial; margin:0; background:#f8fafc; color:#0f172a;}
  .navbar{background:var(--bg); color:var(--fg); padding:10px 20px; display:flex; align-items:center; gap:16px;}
  .navbar a{color:var(--fg2); text-decoration:none; padding:8px 10px; border-radius:8px;}
  .navbar a.active,.navbar a:hover{background:rgba(255,255,255,.08); color:#fff;}
  .brand{font-weight:800; letter-spacing:.5px; margin-right:8px; color:#fff;}
  .wrap{max-width:1100px; margin:24px auto; padding:0 16px;}
  .card{background:#fff; border:1px solid var(--line); border-radius:12px; padding:18px;}
  .card-header{display:flex; align-items:center; justify-content:space-between; gap:12px; margin-bottom:12px}
  .btn{display:inline-block; padding:8px 12px; border:1px solid var(--line); border-radius:10px; text-decoration:none; background:#fff;}
  .btn-primary{border-color:var(--accent); background:var(--accent); color:#fff;}
  .btn-danger{border-color:#ef4444; background:#fee2e2; color:#7f1d1d;}
  .btn-ghost{border-color:transparent; color:var(--muted)}
  table{width:100%; border-collapse:separate; border-spacing:0; border:1px solid var(--line); border-radius:12px; overflow:hidden}
  th,td{padding:10px 12px; border-bottom:1px solid var(--line)}
  th{background:#f1f5f9; text-align:left; font-weight:600}
  tr:last-child td{border-bottom:none}
  .actions{display:flex; gap:8px;}
  .alert{background:#ecfdf5; border:1px solid #a7f3d0; padding:10px 12px; border-radius:10px; margin-bottom:12px}
  form .grid{display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:14px}
  .field{display:flex; flex-direction:column; gap:6px}
  label{font-weight:600; color:#0f172a}
  input,select{padding:10px 12px; border:1px solid var(--line); border-radius:10px; background:#fff}
  small.error{color:#b91c1c}
  @media (max-width: 720px){ form .grid{grid-template-columns:1fr} }
</style>
</head>
<body>

  {{-- MENÚ SUPERIOR --}}
  <nav class="navbar">
    <div class="brand">Ferretería</div>
    <a href="{{ route('home') }}" class="{{ request()->routeIs('home') ? 'active' : '' }}">Inicio</a>
    <a href="{{ route('clientes.index') }}" class="{{ request()->routeIs('clientes.*') ? 'active' : '' }}">Clientes</a>
    {{-- Aquí agregaremos más pestañas: Productos, Pedidos, etc. --}}
  </nav>

  {{-- CONTENIDO DE CADA PÁGINA --}}
  <div class="wrap">
    @if(session('ok')) <div class="card" style="border-left:4px solid #16a34a;">{{ session('ok') }}</div> @endif
    @yield('content')
  </div>

</body>
</html>
