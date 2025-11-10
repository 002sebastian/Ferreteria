<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>{{ config('app.name','Ferreteria') }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  @vite(['resources/css/app.css','resources/js/app.js'])
  <style>
    :root{--bg:#0f172a; --fg:#fff; --fg2:#e2e8f0; --accent:#60a5fa;}
    body{font-family:system-ui,Segoe UI,Roboto,Arial; margin:0; background:#f7fafc;}
    .navbar{background:var(--bg); color:var(--fg); padding:10px 20px; display:flex; align-items:center; gap:16px;}
    .navbar a{color:var(--fg2); text-decoration:none; padding:8px 10px; border-radius:8px;}
    .navbar a.active, .navbar a:hover{background:rgba(255,255,255,0.08); color:#fff;}
    .brand{font-weight:800; letter-spacing:.5px; margin-right:8px; color:#fff;}
    .wrap{max-width:1100px; margin:24px auto; padding:0 16px;}
    .card{background:#fff; border:1px solid #e5e7eb; border-radius:12px; padding:20px;}
    .hero{display:flex; align-items:center; justify-content:space-between; gap:24px; padding:32px 24px; border-radius:16px;
          background:linear-gradient(135deg,#eff6ff,#f8fafc);}
    .hero h1{font-size:48px; margin:0 0 8px 0;}
    .hero p{margin:0; color:#334155;}
    .btn{display:inline-block; padding:10px 14px; border:1px solid #cbd5e1; border-radius:10px; text-decoration:none; color:#0f172a; background:#fff;}
    .btn-primary{border-color:var(--accent); background:#1d4ed8; color:#fff;}
    .grid{display:grid; grid-template-columns:repeat(auto-fit,minmax(240px,1fr)); gap:16px; margin-top:16px;}
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
