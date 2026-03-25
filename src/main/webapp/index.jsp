<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StepStyle — Streetwear Kicks</title>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bebas+Neue&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --black: #0a0a0a;
            --white: #f5f0e8;
            --cream: #e8e0d0;
            --yellow: #f5d800;
            --red: #e8251a;
            --gray: #2a2a2a;
            --mid-gray: #444;
            --border: #333;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        html { scroll-behavior: smooth; }

        body {
            background-color: var(--black);
            color: var(--white);
            font-family: 'Space Mono', monospace;
            cursor: crosshair;
            overflow-x: hidden;
        }

        /* ── NOISE OVERLAY ── */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 9999;
            opacity: 0.4;
        }

        /* ── MARQUEE STRIP ── */
        .marquee-strip {
            background: var(--yellow);
            color: var(--black);
            padding: 8px 0;
            overflow: hidden;
            white-space: nowrap;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1rem;
            letter-spacing: 2px;
            border-bottom: 2px solid var(--black);
        }
        .marquee-inner {
            display: inline-block;
            animation: marquee 22s linear infinite;
        }
        .marquee-inner span { margin: 0 40px; }
        @keyframes marquee {
            from { transform: translateX(0); }
            to   { transform: translateX(-50%); }
        }

        /* ── NAVBAR ── */
        nav {
            position: sticky;
            top: 0;
            z-index: 100;
            background: var(--black);
            border-bottom: 2px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
            height: 64px;
        }
        .nav-logo {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2rem;
            letter-spacing: 4px;
            color: var(--yellow);
            text-decoration: none;
            line-height: 1;
        }
        .nav-logo span { color: var(--red); }

        .nav-links {
            display: flex;
            gap: 32px;
            list-style: none;
        }
        .nav-links a {
            color: var(--cream);
            text-decoration: none;
            font-size: 0.7rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            transition: color 0.2s;
            font-weight: 700;
        }
        .nav-links a:hover { color: var(--yellow); }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .search-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }
        .search-wrap input {
            background: var(--gray);
            border: 1.5px solid var(--border);
            color: var(--white);
            font-family: 'Space Mono', monospace;
            font-size: 0.7rem;
            padding: 7px 36px 7px 14px;
            width: 180px;
            outline: none;
            letter-spacing: 1px;
            transition: border-color 0.2s, width 0.3s;
        }
        .search-wrap input:focus { border-color: var(--yellow); width: 220px; }
        .search-wrap input::placeholder { color: var(--mid-gray); }
        .search-icon {
            position: absolute;
            right: 10px;
            color: var(--mid-gray);
            font-size: 0.8rem;
            pointer-events: none;
        }

        .cart-btn {
            position: relative;
            background: none;
            border: 1.5px solid var(--border);
            color: var(--white);
            padding: 7px 14px;
            cursor: crosshair;
            font-size: 1.1rem;
            transition: border-color 0.2s, background 0.2s;
        }
        .cart-btn:hover { border-color: var(--yellow); background: var(--gray); }
        .cart-count {
            position: absolute;
            top: -6px; right: -6px;
            background: var(--red);
            color: #fff;
            font-size: 0.6rem;
            font-family: 'Space Mono', monospace;
            font-weight: 700;
            width: 18px; height: 18px;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
        }

        /* ── HERO ── */
        .hero {
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: 88vh;
            border-bottom: 2px solid var(--border);
            overflow: hidden;
        }
        .hero-left {
            padding: 80px 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            border-right: 2px solid var(--border);
            position: relative;
        }
        .hero-tag {
            font-size: 0.65rem;
            letter-spacing: 4px;
            text-transform: uppercase;
            color: var(--yellow);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .hero-tag::before {
            content: '';
            display: block;
            width: 30px; height: 2px;
            background: var(--yellow);
        }
        .hero-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: clamp(5rem, 9vw, 9rem);
            line-height: 0.9;
            letter-spacing: -1px;
            color: var(--white);
        }
        .hero-title .outline {
            -webkit-text-stroke: 2px var(--white);
            color: transparent;
        }
        .hero-title .accent { color: var(--yellow); }
        .hero-desc {
            margin-top: 32px;
            font-size: 0.75rem;
            line-height: 1.9;
            color: #888;
            max-width: 380px;
            letter-spacing: 0.5px;
        }
        .hero-actions {
            display: flex;
            gap: 14px;
            margin-top: 40px;
            flex-wrap: wrap;
        }
        .btn-primary {
            background: var(--yellow);
            color: var(--black);
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1rem;
            letter-spacing: 3px;
            padding: 14px 36px;
            border: 2px solid var(--yellow);
            cursor: crosshair;
            transition: background 0.2s, color 0.2s;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary:hover { background: transparent; color: var(--yellow); }
        .btn-ghost {
            background: transparent;
            color: var(--white);
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1rem;
            letter-spacing: 3px;
            padding: 14px 36px;
            border: 2px solid var(--border);
            cursor: crosshair;
            transition: border-color 0.2s, color 0.2s;
            text-decoration: none;
            display: inline-block;
        }
        .btn-ghost:hover { border-color: var(--white); color: var(--yellow); }

        .hero-stats {
            display: flex;
            gap: 40px;
            margin-top: 60px;
            padding-top: 40px;
            border-top: 1px solid var(--border);
        }
        .stat-num {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2.4rem;
            color: var(--yellow);
            line-height: 1;
        }
        .stat-label {
            font-size: 0.6rem;
            letter-spacing: 2px;
            color: #666;
            text-transform: uppercase;
            margin-top: 4px;
        }

        .hero-right {
            background: var(--gray);
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .hero-right::before {
            content: 'STEP\ASTYLE';
            white-space: pre;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 14vw;
            color: rgba(255,255,255,0.03);
            position: absolute;
            line-height: 0.85;
            letter-spacing: -4px;
            text-align: center;
        }
        .hero-shoe-wrapper {
            position: relative;
            z-index: 2;
            text-align: center;
            animation: float 4s ease-in-out infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(-4deg); }
            50%       { transform: translateY(-18px) rotate(-4deg); }
        }
        .hero-shoe-emoji {
            font-size: 12rem;
            display: block;
            filter: drop-shadow(0 30px 60px rgba(245,216,0,0.25));
        }
        .hero-shoe-badge {
            position: absolute;
            top: 10px; right: -20px;
            background: var(--red);
            color: #fff;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 0.85rem;
            letter-spacing: 2px;
            padding: 6px 14px;
            transform: rotate(12deg);
        }

        /* ── SECTION HEADER ── */
        .section-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            padding: 60px 60px 30px;
            border-bottom: 1px solid var(--border);
        }
        .section-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: clamp(3rem, 5vw, 5rem);
            letter-spacing: 2px;
            line-height: 1;
        }
        .section-title span { color: var(--yellow); }
        .section-sub {
            font-size: 0.65rem;
            letter-spacing: 3px;
            color: #555;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .section-link {
            color: var(--yellow);
            font-size: 0.65rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            text-decoration: none;
            border-bottom: 1px solid var(--yellow);
            padding-bottom: 2px;
            transition: color 0.2s;
            margin-bottom: 10px;
        }
        .section-link:hover { color: var(--white); border-color: var(--white); }

        /* ── DEALS STRIP ── */
        .deals-strip {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            border-bottom: 2px solid var(--border);
        }
        .deal-card {
            padding: 36px 40px;
            border-right: 1px solid var(--border);
            transition: background 0.25s;
            cursor: crosshair;
            position: relative;
            overflow: hidden;
        }
        .deal-card:last-child { border-right: none; }
        .deal-card::before {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--yellow);
            transform: translateY(100%);
            transition: transform 0.3s cubic-bezier(0.4,0,0.2,1);
            z-index: 0;
        }
        .deal-card:hover::before { transform: translateY(0); }
        .deal-card > * { position: relative; z-index: 1; }
        .deal-card:hover .deal-label,
        .deal-card:hover .deal-title,
        .deal-card:hover .deal-desc,
        .deal-card:hover .deal-price { color: var(--black); }
        .deal-label {
            font-size: 0.6rem;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: var(--yellow);
            margin-bottom: 12px;
            transition: color 0.25s;
        }
        .deal-card:hover .deal-label { color: var(--black); }
        .deal-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2rem;
            letter-spacing: 2px;
            color: var(--white);
            transition: color 0.25s;
        }
        .deal-desc {
            font-size: 0.68rem;
            color: #666;
            margin-top: 8px;
            line-height: 1.7;
            transition: color 0.25s;
        }
        .deal-price {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1.6rem;
            color: var(--red);
            margin-top: 14px;
            transition: color 0.25s;
        }
        .deal-card:hover .deal-price { color: var(--black); }

        /* ── PRODUCTS GRID ── */
        .products-section { border-bottom: 2px solid var(--border); }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            border-top: 1px solid var(--border);
        }

        .product-card {
            border-right: 1px solid var(--border);
            border-bottom: 1px solid var(--border);
            padding: 0;
            cursor: crosshair;
            position: relative;
            overflow: hidden;
            transition: background 0.2s;
        }
        .product-card:nth-child(3n) { border-right: none; }
        .product-card:hover { background: var(--gray); }

        .product-img-wrap {
            background: #1a1a1a;
            height: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            border-bottom: 1px solid var(--border);
        }
        .product-emoji {
            font-size: 6rem;
            transition: transform 0.4s cubic-bezier(0.34,1.56,0.64,1);
            display: block;
        }
        .product-card:hover .product-emoji { transform: scale(1.18) rotate(-8deg); }

        .product-badge {
            position: absolute;
            top: 14px; left: 14px;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 0.75rem;
            letter-spacing: 2px;
            padding: 4px 10px;
        }
        .badge-new  { background: var(--yellow); color: var(--black); }
        .badge-hot  { background: var(--red);    color: #fff; }
        .badge-ltd  { background: transparent; color: var(--yellow); border: 1px solid var(--yellow); }

        .product-add {
            position: absolute;
            bottom: 14px; right: 14px;
            background: var(--yellow);
            color: var(--black);
            border: none;
            width: 38px; height: 38px;
            font-size: 1.2rem;
            cursor: crosshair;
            opacity: 0;
            transform: scale(0.7);
            transition: opacity 0.25s, transform 0.25s;
        }
        .product-card:hover .product-add { opacity: 1; transform: scale(1); }
        .product-add:hover { background: var(--white); }

        .product-info { padding: 20px 22px 24px; }
        .product-brand {
            font-size: 0.6rem;
            letter-spacing: 3px;
            color: #555;
            text-transform: uppercase;
            margin-bottom: 4px;
        }
        .product-name {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1.4rem;
            letter-spacing: 1px;
            color: var(--white);
            margin-bottom: 6px;
        }
        .product-category {
            font-size: 0.62rem;
            color: #555;
            letter-spacing: 1px;
            margin-bottom: 14px;
        }
        .product-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .product-price {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1.5rem;
            color: var(--yellow);
        }
        .product-stock {
            font-size: 0.6rem;
            letter-spacing: 1px;
            padding: 4px 9px;
            text-transform: uppercase;
        }
        .stock-in  { border: 1px solid #2a6a2a; color: #5dc45d; }
        .stock-ltd { border: 1px solid #7a5200; color: var(--yellow); }
        .stock-out { border: 1px solid #5a1a1a; color: #c44; }

        /* ── FOOTER ── */
        footer {
            background: #050505;
            border-top: 2px solid var(--border);
        }
        .footer-top {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 0;
            border-bottom: 1px solid var(--border);
        }
        .footer-col {
            padding: 52px 40px;
            border-right: 1px solid var(--border);
        }
        .footer-col:last-child { border-right: none; }
        .footer-logo {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2.5rem;
            letter-spacing: 4px;
            color: var(--yellow);
            margin-bottom: 16px;
            display: block;
        }
        .footer-logo span { color: var(--red); }
        .footer-about {
            font-size: 0.68rem;
            line-height: 1.9;
            color: #555;
            max-width: 260px;
        }
        .footer-col-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 1.1rem;
            letter-spacing: 3px;
            color: var(--white);
            margin-bottom: 20px;
        }
        .footer-links { list-style: none; }
        .footer-links li { margin-bottom: 10px; }
        .footer-links a {
            color: #555;
            text-decoration: none;
            font-size: 0.68rem;
            letter-spacing: 1px;
            transition: color 0.2s;
        }
        .footer-links a:hover { color: var(--yellow); }

        .footer-contact-item {
            display: flex;
            gap: 10px;
            margin-bottom: 14px;
            align-items: flex-start;
        }
        .contact-icon { font-size: 0.9rem; margin-top: 2px; flex-shrink: 0; }
        .contact-text { font-size: 0.68rem; color: #555; line-height: 1.6; }

        .footer-bottom {
            padding: 20px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .footer-copy {
            font-size: 0.6rem;
            color: #333;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        .footer-social {
            display: flex;
            gap: 12px;
        }
        .social-btn {
            width: 34px; height: 34px;
            border: 1px solid var(--border);
            background: none;
            color: #555;
            font-size: 0.85rem;
            cursor: crosshair;
            display: flex; align-items: center; justify-content: center;
            transition: border-color 0.2s, color 0.2s;
            text-decoration: none;
        }
        .social-btn:hover { border-color: var(--yellow); color: var(--yellow); }

        /* ── TOAST ── */
        #toast {
            position: fixed;
            bottom: 32px; right: 32px;
            background: var(--yellow);
            color: var(--black);
            font-family: 'Bebas Neue', sans-serif;
            font-size: 0.95rem;
            letter-spacing: 2px;
            padding: 14px 24px;
            z-index: 9999;
            transform: translateY(80px);
            opacity: 0;
            transition: transform 0.3s ease, opacity 0.3s ease;
            pointer-events: none;
        }
        #toast.show { transform: translateY(0); opacity: 1; }

        /* ── SCROLLBAR ── */
        ::-webkit-scrollbar { width: 4px; }
        ::-webkit-scrollbar-track { background: var(--black); }
        ::-webkit-scrollbar-thumb { background: var(--yellow); }
    </style>
</head>
<body>

<!-- MARQUEE -->
<div class="marquee-strip">
    <div class="marquee-inner">
        <span>FREE DELIVERY ON ORDERS ABOVE ₹999</span>
        <span>★</span>
        <span>NEW ARRIVALS — SUMMER 2025</span>
        <span>★</span>
        <span>EXCLUSIVE STREETWEAR COLLECTION</span>
        <span>★</span>
        <span>HYDERABAD'S #1 KICK STORE</span>
        <span>★</span>
        <span>FREE DELIVERY ON ORDERS ABOVE ₹999</span>
        <span>★</span>
        <span>NEW ARRIVALS — SUMMER 2025</span>
        <span>★</span>
        <span>EXCLUSIVE STREETWEAR COLLECTION</span>
        <span>★</span>
        <span>HYDERABAD'S #1 KICK STORE</span>
        <span>★</span>
    </div>
</div>

<!-- NAVBAR -->
<nav>
    <a href="#" class="nav-logo">STEP<span>STYLE</span></a>
    <ul class="nav-links">
        <li><a href="#products">Catalog</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#footer">Contact</a></li>
    </ul>
    <div class="nav-right">
        <div class="search-wrap">
            <input type="text" placeholder="SEARCH KICKS..." id="searchInput" oninput="filterProducts()">
            <span class="search-icon">⌕</span>
        </div>
        <button class="cart-btn" onclick="showToast('CART OPENED')">
            🛒
            <span class="cart-count" id="cartCount">0</span>
        </button>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="hero-left">
        <div class="hero-tag">SS25 Collection</div>
        <h1 class="hero-title">
            LACE<br>
            <span class="outline">UP</span><br>
            <span class="accent">LOUD</span>
        </h1>
        <p class="hero-desc">
            Where streetwear meets sole culture. Drop-worthy kicks, zero compromise.
            Built for the pavement, designed for the culture.
        </p>
        <div class="hero-actions">
            <a href="#products" class="btn-primary">SHOP THE DROP</a>
            <a href="#deals" class="btn-ghost">VIEW DEALS</a>
        </div>
        <div class="hero-stats">
            <div>
                <div class="stat-num">500+</div>
                <div class="stat-label">Styles</div>
            </div>
            <div>
                <div class="stat-num">12K+</div>
                <div class="stat-label">Customers</div>
            </div>
            <div>
                <div class="stat-num">8+</div>
                <div class="stat-label">Top Brands</div>
            </div>
        </div>
    </div>
    <div class="hero-right">
        <div class="hero-shoe-wrapper">
            <span class="hero-shoe-emoji">👟</span>
            <div class="hero-shoe-badge">NEW DROP</div>
        </div>
    </div>
</section>

<!-- DEALS -->
<section id="deals">
    <div class="section-header">
        <div>
            <div class="section-sub">Limited Time</div>
            <h2 class="section-title">HOT <span>DEALS</span></h2>
        </div>
        <a href="#" class="section-link">All Offers →</a>
    </div>
    <div class="deals-strip">
        <div class="deal-card">
            <div class="deal-label">⚡ Flash Sale · Ends Tonight</div>
            <div class="deal-title">FLAT 30% OFF NIKE</div>
            <div class="deal-desc">On all sports shoes above ₹2,499.<br>Use code: SOLE30 at checkout.</div>
            <div class="deal-price">UP TO ₹1,500 OFF</div>
        </div>
        <div class="deal-card">
            <div class="deal-label">🔥 Weekend Special</div>
            <div class="deal-title">BUY 2 GET 1 FREE</div>
            <div class="deal-desc">Mix & match from Adidas, Puma &<br>Reebok casual range. All sizes.</div>
            <div class="deal-price">SAVE BIG THIS WEEKEND</div>
        </div>
        <div class="deal-card">
            <div class="deal-label">🚚 Always On</div>
            <div class="deal-title">FREE DELIVERY</div>
            <div class="deal-desc">On all orders above ₹999.<br>Same-day delivery in Hyderabad.</div>
            <div class="deal-price">₹0 SHIPPING COST</div>
        </div>
    </div>
</section>

<!-- PRODUCTS -->
<section class="products-section" id="products">
    <div class="section-header">
        <div>
            <div class="section-sub">SS25 Catalog</div>
            <h2 class="section-title">THE <span>LINEUP</span></h2>
        </div>
        <a href="#" class="section-link">Full Catalog →</a>
    </div>
    <div class="products-grid" id="productsGrid">

        <div class="product-card" data-name="Air Max Runner Nike Sports">
            <div class="product-img-wrap">
                <span class="product-emoji">👟</span>
                <span class="product-badge badge-hot">HOT</span>
                <button class="product-add" onclick="addToCart(this, '₹3,499')">+</button>
            </div>
            <div class="product-info">
                <div class="product-brand">Nike</div>
                <div class="product-name">Air Max Runner</div>
                <div class="product-category">Sports Shoes</div>
                <div class="product-footer">
                    <div class="product-price">₹3,499</div>
                    <span class="product-stock stock-in">In Stock</span>
                </div>
            </div>
        </div>

        <div class="product-card" data-name="Stan Groove Adidas Casual">
            <div class="product-img-wrap">
                <span class="product-emoji">👞</span>
                <span class="product-badge badge-new">NEW</span>
                <button class="product-add" onclick="addToCart(this, '₹2,799')">+</button>
            </div>
            <div class="product-info">
                <div class="product-brand">Adidas</div>
                <div class="product-name">Stan Groove</div>
                <div class="product-category">Casual Shoes</div>
                <div class="product-footer">
                    <div class="product-price">₹2,799</div>
                    <span class="product-stock stock-in">In Stock</span>
                </div>
            </div>
        </div>

        <div class="product-card" data-name="Oxford Elite Bata Formal">
            <div class="product-img-wrap">
                <span class="product-emoji">👔</span>
                <button class="product-add" onclick="addToCart(this, '₹1,999')">+</button>
            </div>
            <div class="product-info">
                <div class="product-brand">Bata</div>
                <div class="product-name">Oxford Elite</div>
                <div class="product-category">Formal Shoes</div>
                <div class="product-footer">
                    <div class="product-price">₹1,999</div>
                    <span class="product-stock stock-in">In Stock</span>
                </div>
            </div>
        </div>

        <div class="product-card" data-name="Slide Pro Puma Sandals">
            <div class="product-img-wrap">
                <span class="product-emoji">🩴</span>
                <span class="product-badge badge-ltd">LIMITED</span>
                <button class="product-add" onclick="addToCart(this, '₹1,299')">+</button>
            </div>
            <div class="product-info">
                <div class="product-brand">Puma</div>
                <div class="product-name">Slide Pro</div>
                <div class="product-category">Sandals</div>
                <div class="product-footer">
                    <div class="product-price">₹1,299</div>
                    <span class="product-stock stock-ltd">Limited</span>
                </div>
            </div>
        </div>

        <div class="product-card" data-name="Nano Sprint Reebok Running">
            <div class="product-img-wrap">
                <span class="product-emoji">🏃</span>
                <span class="product-badge badge-new">NEW</span>
                <button class="product-add" onclick="addToCart(this, '₹4,199')">+</button>
            </div>
            <div class="product-info">
                <div class="product-brand">Reebok</div>
                <div class="product-name">Nano Sprint</div>
                <div class="product-category">Running Shoes</div>
                <div class="product-footer">
                    <div class="product-price">₹4,199</div>
                    <span class="product-stock stock-in">In Stock</span>
                </div>
            </div>
        </div>

        <div class="product-card" data-name="High Court Nike Basketball">
            <div class="product-img-wrap">
                <span class="product-emoji">🏀</span>
                <span class="product-badge badge-hot">HOT</span>
                <button class="product-add" onclick="addToCart(this, '₹5,499')">+</button>
            </div>
            <div class="product-info">
                <div class="product-brand">Nike</div>
                <div class="product-name">High Court</div>
                <div class="product-category">Basketball Shoes</div>
                <div class="product-footer">
                    <div class="product-price">₹5,499</div>
                    <span class="product-stock stock-in">In Stock</span>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- FOOTER -->
<footer id="footer">
    <div class="footer-top">
        <div class="footer-col">
            <span class="footer-logo">STEP<span>STYLE</span></span>
            <p class="footer-about">
                Hyderabad's premier streetwear kick destination.
                Stocking the freshest drops from global brands — because
                every step is a statement.
            </p>
        </div>
        <div class="footer-col">
            <div class="footer-col-title">Navigate</div>
            <ul class="footer-links">
                <li><a href="#">New Arrivals</a></li>
                <li><a href="#">Sports</a></li>
                <li><a href="#">Casual</a></li>
                <li><a href="#">Formal</a></li>
                <li><a href="#">Sale</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <div class="footer-col-title">Support</div>
            <ul class="footer-links">
                <li><a href="#">Size Guide</a></li>
                <li><a href="#">Track Order</a></li>
                <li><a href="#">Returns</a></li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Warranty</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <div class="footer-col-title">Contact</div>
            <div class="footer-contact-item">
                <span class="contact-icon">📍</span>
                <span class="contact-text">Hyderabad, Telangana<br>India — 500 001</span>
            </div>
            <div class="footer-contact-item">
                <span class="contact-icon">📞</span>
                <span class="contact-text">+91-9876543210</span>
            </div>
            <div class="footer-contact-item">
                <span class="contact-icon">📧</span>
                <span class="contact-text">support@stepstyle.com</span>
            </div>
            <div class="footer-contact-item">
                <span class="contact-icon">🕐</span>
                <span class="contact-text">Mon–Sat: 10AM – 9PM<br>Sun: 11AM – 7PM</span>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="footer-copy">© 2025 StepStyle — All Rights Reserved</div>
        <div class="footer-social">
            <a href="#" class="social-btn">ig</a>
            <a href="#" class="social-btn">tw</a>
            <a href="#" class="social-btn">yt</a>
            <a href="#" class="social-btn">fb</a>
        </div>
    </div>
</footer>

<!-- TOAST -->
<div id="toast">ADDED TO CART ✓</div>

<script>
    let cartCount = 0;

    function addToCart(btn, price) {
        cartCount++;
        document.getElementById('cartCount').textContent = cartCount;
        showToast('ADDED TO CART — ' + price + ' ✓');
    }

    function showToast(msg) {
        const toast = document.getElementById('toast');
        toast.textContent = msg;
        toast.classList.add('show');
        setTimeout(() => toast.classList.remove('show'), 2200);
    }

    function filterProducts() {
        const q = document.getElementById('searchInput').value.toLowerCase();
        document.querySelectorAll('.product-card').forEach(card => {
            const name = card.getAttribute('data-name').toLowerCase();
            card.style.display = name.includes(q) ? '' : 'none';
        });
    }
</script>

</body>
</html>
