<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>AT.STAR</title>
<style>
:root{--cream:#FAF9F5;--cream2:#F0EEE6;--ink:#1F1E1D;--grey:#6B7280;--claude:#D97757;--claude2:#E8935A;--card:#FFFFFF}
*{margin:0;padding:0;box-sizing:border-box;-webkit-tap-highlight-color:transparent}
html{scroll-behavior:smooth}
body{font-family:Georgia,'Times New Roman',serif;overflow:hidden;background:#000;color:#fff;-webkit-font-smoothing:antialiased;text-rendering:optimizeLegibility}
button{cursor:pointer;font-family:inherit}
img,svg{display:block}

/* STAR */
.starBig{width:230px;height:230px;filter:drop-shadow(0 20px 40px rgba(217,119,87,.35));animation:comeUp 1.8s cubic-bezier(.2,.8,.2,1) forwards}
@keyframes comeUp{0%{transform:translateY(400px) rotate(-360deg) scale(.3);opacity:0}60%{transform:translateY(0) rotate(20deg) scale(1.08);opacity:1}100%{transform:translateY(0) rotate(0deg) scale(1);opacity:1}}
.starSmall{width:112px;height:112px;filter:drop-shadow(0 10px 22px rgba(217,119,87,.3));animation:slowSpin 14s linear infinite}
@keyframes slowSpin{from{transform:rotate(0deg)}to{transform:rotate(360deg)}}

/* PAGES - SMOOTH */
.page{min-height:100dvh;display:none;flex-direction:column;align-items:center;justify-content:center;padding:25px;opacity:0;transform:translateY(24px);transition:opacity .55s ease,transform .55s ease}
.page.show{display:flex;opacity:1;transform:translateY(0)}
#loading{background:#111110;gap:30px;transition:opacity .7s ease}
#loading.hide{opacity:0;pointer-events:none}
#loading h1{font-size:46px;letter-spacing:9px;font-weight:400;opacity:0;animation:fadeUp 1s ease 1.2s forwards}
@keyframes fadeUp{from{transform:translateY(28px);opacity:0}to{transform:translateY(0);opacity:1}}

/* CREATE ACCOUNT - CLAUDE STYLE */
#create{background:#111110}
#create h2{font-size:42px;letter-spacing:8px;margin:24px 0 8px;font-weight:400}
#create .sub{color:#9CA3AF;font-size:16px;margin-bottom:38px;font-family:Arial,sans-serif;letter-spacing:.3px}
.box{width:100%;max-width:360px;display:flex;flex-direction:column;gap:20px}
.field{border:1px solid #3F3F3E;border-radius:16px;padding:16px 18px;background:#1C1C1B;transition:border-color .25s ease,box-shadow .25s ease}
.field label{display:block;font-size:12px;color:#D1D5DB;font-family:Arial,sans-serif;letter-spacing:1.5px;margin-bottom:10px}
.field input{width:100%;border:none;background:transparent;color:#fff;font-size:19px;outline:none;font-family:Arial,sans-serif}
.field input::placeholder{color:#EDE9E3}
.field:focus-within{border-color:var(--claude);box-shadow:0 0 0 3px rgba(217,119,87,.18)}
.agree{display:flex;align-items:center;gap:11px;font-family:Arial,sans-serif;font-size:16px;cursor:pointer;margin-top:4px;color:#EDE9E3}
.agree input{width:20px;height:20px;accent-color:var(--claude)}
.agreedBtn{width:100%;max-width:360px;padding:18px;border:none;border-radius:16px;background:var(--claude);color:#fff;font-size:19px;letter-spacing:.5px;margin-top:20px;box-shadow:0 12px 28px rgba(217,119,87,.32);transition:transform .15s ease,box-shadow .25s ease}
.agreedBtn:active{transform:scale(.97)}

/* INSIDE - CLAUDE STYLE, HIGH QUALITY */
#inside{background:var(--cream);color:var(--ink);justify-content:flex-start;padding:78px 22px 90px;text-align:center;overflow-y:auto}
#inside h1{font-family:Arial,sans-serif;font-weight:900;font-size:54px;letter-spacing:1px;line-height:1;margin-top:54px;color:var(--ink)}
#inside .plat{font-family:Arial,sans-serif;font-size:14px;letter-spacing:9px;margin-top:13px;color:#4B5563}
#inside .msg{font-family:Arial,sans-serif;color:var(--grey);margin-top:20px;font-size:16px}
#inside .card{width:100%;max-width:390px;background:var(--card);border:1px solid #E8E5DE;border-radius:22px;padding:26px;margin-top:24px;text-align:left;font-family:Arial,sans-serif;box-shadow:0 18px 40px rgba(31,30,29,.08);display:none}
#inside .card.show{display:block;animation:cardIn .45s ease}
@keyframes cardIn{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:translateY(0)}}
#inside .card h3{font-family:Georgia,serif;font-size:26px;margin-bottom:11px;line-height:1.25}
#inside .card p{color:#4B5563;font-size:15.5px;line-height:1.75}
#inside .card li{color:#374151;font-size:15.5px;line-height:1.7;margin-left:18px;margin-top:7px}
.badge{display:inline-block;background:var(--ink);color:#fff;font-size:10.5px;letter-spacing:1.8px;padding:6px 10px;border-radius:20px;margin-left:8px;vertical-align:middle}
.lockBox{text-align:center;padding:18px 0 6px}
.lockBox .bigLock{font-size:54px;line-height:1}
.madeBy{position:fixed;bottom:20px;left:0;right:0;text-align:center;font-family:Arial,sans-serif;font-size:15px;color:var(--ink);letter-spacing:.4px;display:none;z-index:40;background:linear-gradient(to top,var(--cream) 65%,transparent)}
.madeBy.show{display:block}

/* MENU BUTTON - SMALL = */
#menuBtn{position:fixed;top:16px;left:16px;z-index:50;width:46px;height:46px;border:1px solid #D6D3CC;background:#FFFFFF;color:var(--ink);font-size:22px;border-radius:13px;display:none;box-shadow:0 8px 20px rgba(0,0,0,.08)}
#menuBtn.show{display:block}
#drawer{position:fixed;top:0;left:0;height:100dvh;width:82%;max-width:320px;background:#111110;color:#fff;z-index:60;transform:translateX(-105%);transition:transform .42s cubic-bezier(.2,.8,.2,1);padding:28px 24px;overflow:hidden}
#drawer.open{transform:translateX(0)}
#drawer h2{letter-spacing:4px;font-size:28px;padding-right:42px;white-space:nowrap;line-height:1.1}
#drawer small{color:#9CA3AF;font-family:Arial,sans-serif;letter-spacing:5px;display:block;margin-top:7px}
#drawer .links{margin-top:36px}
#drawer .links button{display:flex;align-items:center;gap:13px;width:100%;text-align:left;background:none;border:none;border-bottom:1px solid #262625;color:#fff;font-size:19px;padding:18px 2px;font-family:Arial,sans-serif;white-space:nowrap;transition:color .2s ease,padding-left .2s ease}
#drawer .links button:active{color:var(--claude2);padding-left:6px}
#drawer .foot{color:#9CA3AF;font-family:Arial,sans-serif;font-size:13px;letter-spacing:1.5px;position:absolute;bottom:26px;left:24px;right:20px}
#closeBtn{position:absolute;top:20px;right:16px;width:36px;height:36px;background:#262625;border:none;color:#fff;font-size:18px;border-radius:50%;z-index:2}
#overlay{position:fixed;inset:0;background:rgba(17,17,16,.55);backdrop-filter:blur(2px);z-index:55;display:none}
#overlay.show{display:block}
</style>
</head>
<body>

<button id="menuBtn" aria-label="Menu" onclick="openMenu()">☰</button>
<div id="overlay" onclick="closeMenu()"></div>

<div id="drawer">
<button id="closeBtn" onclick="closeMenu()">✕</button>
<h2>AT.STAR</h2>
<small>PLATFORM</small>
<div class="links">
<button onclick="goPage('project')">⭐ &nbsp;Project</button>
<button onclick="goPage('about')">✦ &nbsp;About AT.STAR</button>
<button onclick="goPage('founder')">👤 &nbsp;About Founder</button>
<button onclick="goPage('ai')">🔐 &nbsp;GOT-Astra AI</button>
</div>
<p class="foot">Made by Arya Varamurthi ❤</p>
</div>

<div class="page show" id="loading">
<div class="starBig">
<svg viewBox="0 0 200 200" width="100%" height="100%"><defs><radialGradient id="g" cx="50%" cy="50%"><stop offset="0%" stop-color="#F9CFAE"/><stop offset="55%" stop-color="#D97757"/><stop offset="100%" stop-color="#C85A26"/></radialGradient></defs><g fill="url(#g)"><ellipse cx="100" cy="52" rx="26" ry="52"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(36 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(72 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(108 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(144 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(180 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(216 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(252 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(288 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(324 100 100)"/></g></svg>
</div>
<h1>AT.STAR</h1>
</div>

<div class="page" id="create">
<div class="starSmall">
<svg viewBox="0 0 200 200" width="100%" height="100%"><g fill="url(#g)"><ellipse cx="100" cy="52" rx="26" ry="52"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(36 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(72 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(108 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(144 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(180 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(216 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(252 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(288 100 100)"/><ellipse cx="100" cy="52" rx="26" ry="52" transform="rotate(324 100 100)"/></g></svg>
</div>
<h2>AT.STAR</h2>
<p class="sub">Create your account</p>
<div class="box">
<div class="field"><label>NAME</label><input id="name" type="text" placeholder="Your name"></div>
<div class="field"><label>AGE</label><input id="age" type="number" placeholder="Your age"></div>
<label class="agree"><input id="tick" type="checkbox"> I Agreed</label>
</div>
<button class="agreedBtn" onclick="goInside()">Agreed</button>
</div>

<div class="page" id="inside">
<h1>AT.STAR</h1>
<div class="plat">PLATFORM</div>
<p class="msg" id="welcomeText"></p>
<div class="card" id="insideCard"></div>
</div>

<p class="madeBy" id="madeBy">Made by Arya Varamurthi ❤</p>

<script>
function showPage(id){
document.querySelectorAll('.page').forEach(function(p){p.classList.remove('show');p.style.display='none'});
var el=document.getElementById(id);
el.style.display='flex';
setTimeout(function(){el.classList.add('show')},50);
}
setTimeout(function(){
document.getElementById('loading').classList.add('hide');
setTimeout(function(){showPage('create')},700);
},2800);

function goInside(){
var n=document.getElementById('name').value;
var a=document.getElementById('age').value;
var t=document.getElementById('tick').checked;
if(!n){alert('Please enter your name');return;}
if(!a){alert('Please enter your age');return;}
if(!t){alert('Please tick I Agreed');return;}
document.getElementById('menuBtn').classList.add('show');
document.getElementById('madeBy').classList.add('show');
showPage('inside');
document.getElementById('welcomeText').innerText='';
var card=document.getElementById('insideCard');
card.classList.remove('show');card.innerHTML='';
}
function openMenu(){document.getElementById('drawer').classList.add('open');document.getElementById('overlay').classList.add('show');}
function closeMenu(){document.getElementById('drawer').classList.remove('open');document.getElementById('overlay').classList.remove('show');}

function goPage(type){
closeMenu();
var card=document.getElementById('insideCard');
var msg=document.getElementById('welcomeText');
card.classList.add('show');

if(type=='project'){
msg.innerText='Upcoming Projects';
card.innerHTML='<h3>Project ⭐</h3><p>Upcoming projects from AT.STAR, coming soon:</p><ul><li><b>GOT-Astra</b><span class="badge">COMING SOON</span></li><li><b>Nexora 2.2</b><span class="badge">COMING SOON</span></li><li><b>Nexora 3.0</b><span class="badge">COMING SOON</span></li><li><b>GOT-Astra 4.3 Series</b><span class="badge">COMING SOON</span></li></ul><p style="margin-top:14px">All of these are being built inside AT.STAR, and will launch one by one.</p>';
}
if(type=='about'){
msg.innerText='About AT.STAR';
card.innerHTML='<h3>About AT.STAR ✦</h3><p>AT.STAR is a premium platform.</p><p style="margin-top:12px"><b>In the upcoming time, AT.STAR will:</b></p><ul><li>Bring all its AI projects to one place</li><li>Launch new tools and new versions</li><li>Build a simple, fast and premium experience for users</li><li>Make GOT-Astra and Nexora a big platform</li></ul><p style="margin-top:12px">AT.STAR has just started, and it will become very big.</p>';
}
if(type=='founder'){
msg.innerText='About Founder';
card.innerHTML='<h3>About Founder 👤</h3><p><b>Arya Varamurthi ❤</b></p><p style="margin-top:12px">Arya Varamurthi is the founder of AT.STAR.</p><p style="margin-top:12px">He dreamed big at a young age, designed it himself, and built AT.STAR with his own vision.</p><p style="margin-top:12px">His dream is to build a big, premium AI platform from India, for the world.</p><p style="margin-top:12px">Simple to use, big to think, and never stop, that is who he is. ❤</p><p style="margin-top:14px"><b>Made by Arya Varamurthi ❤</b></p>';
}
if(type=='ai'){
msg.innerText='GOT-Astra AI';
card.innerHTML='<div class="lockBox"><div class="bigLock">🔐</div><h3 style="margin-top:14px">GOT-Astra AI is Locked</h3><p style="margin-top:10px">This is locked for now.<br>GOT-Astra AI is coming soon.<br><b>Coming Soon...</b></p></div>';
}
}
</script>

</body>
</html>
