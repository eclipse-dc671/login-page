
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Login Form V7</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@500;600;700&family=Plus+Jakarta+Sans:wght@400;500;600&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#050707; --yellow:#a0c0d0; --acc2:#cfe0e8; --rgb:160,192,208; --yellow-glow:rgba(160,192,208,.38);
  --text:#f3f1ec; --muted:#8d8b86; --line:rgba(255,255,255,.12);
  --field:rgba(255,255,255,.045);
}
*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%}
body{
  background:var(--bg);color:var(--text);
  font-family:"Plus Jakarta Sans",system-ui,sans-serif;
  display:grid;place-items:center;overflow-x:hidden;
  padding:calc(max(20px,env(safe-area-inset-top)) + 58px) 16px max(20px,env(safe-area-inset-bottom));
}
#bg{position:fixed;inset:0;width:100%;height:100%;z-index:0}
.vignette{position:fixed;inset:0;z-index:1;pointer-events:none;
  background:radial-gradient(ellipse at 50% 45%,transparent 30%,rgba(0,0,0,.65) 100%)}

.stage{position:relative;z-index:2;width:min(440px,100%)}
/* small chamfered tab behind the card, top-left */
.tab{position:absolute;left:-26px;top:-18px;width:78px;height:70px;
  background:linear-gradient(160deg,rgba(255,255,255,.16),rgba(255,255,255,.02));
  clip-path:polygon(0 100%,0 26px,26px 0,100% 0,100% 100%);
  backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px)}
.card-edge{
  --cut:30px;background-size:260% 260%;animation:shimmer 6s ease-in-out infinite;
  clip-path:polygon(var(--cut) 0,100% 0,100% calc(100% - var(--cut)),calc(100% - var(--cut)) 100%,0 100%,0 var(--cut));
  background:linear-gradient(150deg,rgba(255,255,255,.35),rgba(255,255,255,.06) 40%,rgba(var(--rgb),.28));
  padding:1px;
}
.card{
  clip-path:inherit;
  background:linear-gradient(160deg,rgba(20,28,34,.72),rgba(5,7,7,.82));
  backdrop-filter:blur(22px) saturate(1.2);-webkit-backdrop-filter:blur(22px) saturate(1.2);
  padding:34px 30px 26px;min-height:300px;position:relative;
}
.card-edge{clip-path:polygon(30px 0,100% 0,100% calc(100% - 30px),calc(100% - 30px) 100%,0 100%,0 30px)}
.card{clip-path:polygon(29px 0,100% 0,100% calc(100% - 29px),calc(100% - 29px) 100%,0 100%,0 29px)}

.view{transition:opacity .35s ease,transform .35s ease}
.view[hidden]{display:none}
.card.busy .view{opacity:0;transform:scale(.97);pointer-events:none}

h1{font-family:Outfit,sans-serif;font-weight:600;font-size:30px;letter-spacing:-.01em;line-height:1.1}
h1 span{color:var(--yellow)}
.sub{color:var(--muted);font-size:13px;margin:8px 0 22px;line-height:1.5}

label{display:block;font-size:12.5px;font-weight:500;color:#cfcdc8;margin:14px 0 7px}
.row{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.field{position:relative}
.field svg.i{position:absolute;left:13px;top:50%;translate:0 -50%;width:16px;height:16px;stroke:var(--muted);fill:none;stroke-width:1.7;pointer-events:none}
.field input{
  width:100%;height:46px;border-radius:12px;border:1px solid var(--line);
  background:var(--field);color:var(--text);font:inherit;font-size:14px;
  padding:0 40px 0 40px;outline:none;transition:border-color .2s,box-shadow .2s,background .2s;
}
.field input::placeholder{color:#5f5d59}
.field input:focus{border-color:rgba(var(--rgb),.7);box-shadow:0 0 0 3px rgba(var(--rgb),.14);background:rgba(255,255,255,.07)}
.eye{position:absolute;right:6px;top:50%;translate:0 -50%;width:34px;height:34px;border:0;background:none;
  display:grid;place-items:center;cursor:pointer;border-radius:8px}
.eye svg{width:16px;height:16px;stroke:var(--muted);fill:none;stroke-width:1.7}
.eye:hover svg{stroke:var(--text)}
.eye:focus-visible,.link:focus-visible,.social:focus-visible,.cta:focus-visible,.check input:focus-visible{outline:2px solid var(--yellow);outline-offset:2px}

.meta{display:flex;justify-content:space-between;align-items:center;margin:14px 0 18px;font-size:12.5px;color:var(--muted)}
.check{display:flex;align-items:center;gap:8px;cursor:pointer}
.check input{appearance:none;width:16px;height:16px;border-radius:4px;border:1px solid #6b6963;background:transparent;cursor:pointer;display:grid;place-items:center}
.check input:checked{background:var(--yellow);border-color:var(--yellow)}
.check input:checked::after{content:"";width:8px;height:4px;border-left:2px solid #111;border-bottom:2px solid #111;rotate:-45deg;translate:0 -1px}
.link{color:var(--muted);background:none;border:0;font:inherit;cursor:pointer;text-decoration:none}
.link:hover{color:var(--text)}
.link.accent{color:var(--yellow)}

.cta{
  width:100%;height:46px;border:0;border-radius:11px;cursor:pointer;
  background:linear-gradient(180deg,var(--acc2),var(--yellow));color:#050707;
  font:600 14.5px "Plus Jakarta Sans",sans-serif;display:flex;align-items:center;justify-content:center;gap:8px;
  box-shadow:0 0 28px var(--yellow-glow),inset 0 1px 0 rgba(255,255,255,.55);
  transition:transform .15s,box-shadow .2s;
}
.cta:hover{transform:translateY(-1px);box-shadow:0 0 40px rgba(var(--rgb),.5),inset 0 1px 0 rgba(255,255,255,.55)}
.cta:active{transform:translateY(0) scale(.99)}
.cta svg{width:15px;height:15px;stroke:currentColor;fill:none;stroke-width:2.2;transition:translate .2s}
.cta:hover svg{translate:3px 0}

.divider{text-align:center;color:#6a6862;font-size:10.5px;letter-spacing:.14em;margin:18px 0 14px;display:flex;align-items:center;gap:10px}
.divider::before,.divider::after{content:"";height:1px;flex:1;background:var(--line)}
.socials{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.social{height:42px;border-radius:11px;border:1px solid var(--line);background:var(--field);color:var(--text);
  font:500 13px "Plus Jakarta Sans",sans-serif;display:flex;align-items:center;justify-content:center;gap:8px;cursor:pointer;transition:background .2s,border-color .2s}
.social:hover{background:rgba(255,255,255,.09);border-color:rgba(255,255,255,.25)}
.social svg{width:15px;height:15px}
.switch{text-align:center;font-size:12.5px;color:var(--muted);margin-top:18px}
.switch .link{margin-left:4px;font-weight:600}

/* loader shown while switching between the two forms */
.loader{position:absolute;inset:0;display:grid;place-items:center;opacity:0;pointer-events:none;transition:opacity .3s}
.card.busy .loader{opacity:1}
.sq{width:46px;height:46px;border:1.5px solid rgba(255,255,255,.35);border-radius:9px;position:relative;
  background:rgba(255,255,255,.04);animation:spin 1.1s cubic-bezier(.6,0,.3,1) infinite}
.sq::after{content:"";position:absolute;inset:11px;border:1.5px solid rgba(255,255,255,.55);border-radius:5px}
@keyframes spin{to{rotate:360deg}}
@keyframes shimmer{0%,100%{background-position:0% 0%}50%{background-position:100% 100%}}

.toast{position:fixed;left:50%;bottom:max(24px,env(safe-area-inset-bottom));translate:-50% 30px;opacity:0;z-index:5;
  background:rgba(20,20,18,.92);border:1px solid rgba(var(--rgb),.4);color:var(--text);padding:12px 18px;border-radius:12px;
  font-size:13px;transition:.3s;pointer-events:none;max-width:90vw}
.toast.show{translate:-50% 0;opacity:1}
.err{color:#ff8a7a;font-size:11.5px;margin-top:6px;min-height:0}

@media (max-width:480px){
  .card{padding:28px 20px 22px}
  .row{grid-template-columns:1fr}
  .tab{left:-10px}
}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition:none!important}}

.themes{position:fixed;top:max(12px,env(safe-area-inset-top));left:50%;translate:-50% 0;z-index:4;display:flex;align-items:center;gap:10px;
  padding:8px 14px;border-radius:999px;background:rgba(10,12,14,.55);backdrop-filter:blur(14px);-webkit-backdrop-filter:blur(14px);
  border:1px solid var(--line);max-width:calc(100vw - 24px);overflow-x:auto;scrollbar-width:none}
.themes::-webkit-scrollbar{display:none}
.themes .tl{font-size:12px;color:var(--muted);margin-right:2px;white-space:nowrap}
#sw{display:flex;gap:9px}
#sw button{flex:none;width:22px;height:22px;border-radius:50%;border:2px solid transparent;cursor:pointer;background:var(--c);
  box-shadow:0 0 0 1px rgba(255,255,255,.25);transition:transform .15s,box-shadow .15s}
#sw button:hover{transform:scale(1.15)}
#sw button.on{box-shadow:0 0 0 2px #050707,0 0 0 4px #fff}
#sw button:focus-visible,.custom:focus-within{outline:2px solid #fff;outline-offset:3px}
.custom{flex:none;width:22px;height:22px;border-radius:50%;position:relative;overflow:hidden;cursor:pointer;
  background:conic-gradient(#f44,#fd4,#4f6,#4df,#84f,#f4a,#f44);box-shadow:0 0 0 1px rgba(255,255,255,.25)}
.custom input{position:absolute;inset:-6px;width:40px;height:40px;opacity:0;cursor:pointer}
@media (max-width:480px){.themes .tl{display:none}}
</style>
</head>
<body>
<canvas id="bg" aria-hidden="true"></canvas>
<div class="vignette"></div>
<nav class="themes" aria-label="Theme colour"><span class="tl">Theme</span><div id="sw"></div>
  <label class="custom" title="Custom colour"><input type="color" id="cc" value="#a0c0d0" aria-label="Pick a custom colour"></label></nav>

<main class="stage">
  <div class="tab" aria-hidden="true"></div>
  <div class="card-edge">
    <section class="card" id="card">

      <!-- Sign in -->
      <form class="view" id="signin" novalidate>
        <h1>Welcome <span>Back</span></h1>
        <p class="sub">Enter your credentials to access your secure account</p>

        <label for="si-email">Email Address</label>
        <div class="field">
          <svg class="i" viewBox="0 0 24 24"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="m3 7 9 6 9-6"/></svg>
          <input id="si-email" type="email" placeholder="name@domain.com" autocomplete="email">
        </div>

        <label for="si-pass">Password</label>
        <div class="field">
          <svg class="i" viewBox="0 0 24 24"><rect x="5" y="11" width="14" height="9" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
          <input id="si-pass" type="password" placeholder="••••••••" autocomplete="current-password">
          <button type="button" class="eye" aria-label="Show password" data-eye="si-pass"></button>
        </div>
        <div class="err" id="si-err" role="alert"></div>

        <div class="meta">
          <label class="check" style="margin:0"><input type="checkbox" checked> Remember me</label>
          <button type="button" class="link" data-toast="Password reset link sent to your email">Forgot password?</button>
        </div>

        <button class="cta" type="submit">Sign In <svg viewBox="0 0 24 24"><path d="M5 12h14M13 6l6 6-6 6"/></svg></button>

        <div class="divider">OR CONTINUE WITH</div>
        <div class="socials">
          <button type="button" class="social" data-social="Google"></button>
          <button type="button" class="social" data-social="Apple"></button>
        </div>
        <p class="switch">Don’t have an account?<button type="button" class="link accent" data-go="signup">Sign Up</button></p>
      </form>

      <!-- Sign up -->
      <form class="view" id="signup" novalidate hidden>
        <h1>Create <span>Account</span></h1>
        <p class="sub">Join us today to access your secure workspace</p>

        <label for="su-name">Full Name</label>
        <div class="field">
          <svg class="i" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21c1-4.5 4-6 8-6s7 1.5 8 6"/></svg>
          <input id="su-name" type="text" placeholder="Alex Johnson" autocomplete="name">
        </div>

        <label for="su-email">Email Address</label>
        <div class="field">
          <svg class="i" viewBox="0 0 24 24"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="m3 7 9 6 9-6"/></svg>
          <input id="su-email" type="email" placeholder="name@domain.com" autocomplete="email">
        </div>

        <div class="row">
          <div>
            <label for="su-pass">Password</label>
            <div class="field">
              <svg class="i" viewBox="0 0 24 24"><rect x="5" y="11" width="14" height="9" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
              <input id="su-pass" type="password" placeholder="••••••••" autocomplete="new-password">
              <button type="button" class="eye" aria-label="Show password" data-eye="su-pass"></button>
            </div>
          </div>
          <div>
            <label for="su-pass2">Confirm Password</label>
            <div class="field">
              <svg class="i" viewBox="0 0 24 24"><rect x="5" y="11" width="14" height="9" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
              <input id="su-pass2" type="password" placeholder="••••••••" autocomplete="new-password">
              <button type="button" class="eye" aria-label="Show password" data-eye="su-pass2"></button>
            </div>
          </div>
        </div>
        <div class="err" id="su-err" role="alert"></div>

        <div class="meta" style="justify-content:flex-start">
          <label class="check" style="margin:0"><input type="checkbox" id="su-terms" checked> I agree to the Terms &amp; Privacy Policy</label>
        </div>

        <button class="cta" type="submit">Create Account <svg viewBox="0 0 24 24"><path d="M5 12h14M13 6l6 6-6 6"/></svg></button>

        <div class="divider">OR SIGN UP WITH</div>
        <div class="socials">
          <button type="button" class="social" data-social="Google"></button>
          <button type="button" class="social" data-social="Apple"></button>
        </div>
        <p class="switch">Already have an account?<button type="button" class="link accent" data-go="signin">Sign In</button></p>
      </form>

      <div class="loader" aria-hidden="true"><div class="sq"></div></div>
    </section>
  </div>
</main>
<div class="toast" id="toast" role="status"></div>

<script>
/* ---------- icons ---------- */
const EYE='<svg viewBox="0 0 24 24"><path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12Z"/><circle cx="12" cy="12" r="3"/></svg>';
const EYE_OFF='<svg viewBox="0 0 24 24"><path d="M3 3l18 18M10.6 6.2A9.7 9.7 0 0 1 12 6c6.4 0 10 6 10 6a17 17 0 0 1-3.2 3.9M6.6 7.6A16.6 16.6 0 0 0 2 12s3.6 7 10 7c1.6 0 3-.4 4.3-1"/></svg>';
const GOOGLE='<svg viewBox="0 0 24 24"><path fill="#EA4335" d="M12 10.2v3.9h5.5c-.2 1.3-1.6 3.8-5.5 3.8a6 6 0 0 1 0-12c1.9 0 3.1.8 3.8 1.5l2.6-2.5A9.6 9.6 0 0 0 12 2.4a9.6 9.6 0 1 0 0 19.2c5.5 0 9.2-3.9 9.2-9.3 0-.6-.1-1.1-.2-1.6H12Z"/></svg>';
const APPLE='<svg viewBox="0 0 24 24" fill="#fff"><path d="M12.152 6.896c-.948 0-2.415-1.078-3.96-1.04-2.04.027-3.91 1.183-4.961 3.014-2.117 3.675-.546 9.103 1.519 12.09 1.013 1.454 2.208 3.09 3.792 3.039 1.52-.065 2.09-.987 3.935-.987 1.831 0 2.35.987 3.96.948 1.637-.026 2.676-1.48 3.676-2.948 1.156-1.688 1.636-3.325 1.662-3.415-.039-.013-3.182-1.221-3.22-4.857-.026-3.04 2.48-4.494 2.597-4.559-1.429-2.09-3.623-2.324-4.39-2.376-2-.156-3.675 1.09-4.61 1.09zM15.53 3.83c.843-1.012 1.4-2.427 1.245-3.83-1.207.052-2.662.805-3.532 1.818-.78.896-1.454 2.338-1.273 3.714 1.338.104 2.715-.688 3.559-1.701"/></svg>';
document.querySelectorAll('.eye').forEach(b=>b.innerHTML=EYE);
document.querySelectorAll('.social').forEach(b=>b.innerHTML=(b.dataset.social==='Google'?GOOGLE:APPLE)+b.dataset.social);

/* ---------- toast ---------- */
const toast=document.getElementById('toast');let tt;
function say(msg){toast.textContent=msg;toast.classList.add('show');clearTimeout(tt);tt=setTimeout(()=>toast.classList.remove('show'),2600)}
document.querySelectorAll('[data-toast]').forEach(b=>b.onclick=()=>say(b.dataset.toast));
document.querySelectorAll('[data-social]').forEach(b=>b.onclick=()=>say('Continuing with '+b.dataset.social+'…'));

/* ---------- show / hide password ---------- */
document.querySelectorAll('.eye').forEach(b=>b.onclick=()=>{
  const i=document.getElementById(b.dataset.eye),show=i.type==='password';
  i.type=show?'text':'password';b.innerHTML=show?EYE_OFF:EYE;
  b.setAttribute('aria-label',show?'Hide password':'Show password');
});

/* ---------- switch forms with the loader square in between ---------- */
const card=document.getElementById('card'),forms={signin:document.getElementById('signin'),signup:document.getElementById('signup')};
let busy=false;
document.querySelectorAll('[data-go]').forEach(b=>b.onclick=()=>{
  if(busy)return;busy=true;card.classList.add('busy');
  setTimeout(()=>{
    const to=b.dataset.go;
    Object.entries(forms).forEach(([k,f])=>f.hidden=k!==to);
    card.classList.remove('busy');busy=false;
  },750);
});

/* ---------- validation ---------- */
const mailOK=v=>/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v);
forms.signin.onsubmit=e=>{
  e.preventDefault();const em=document.getElementById('si-email').value.trim(),pw=document.getElementById('si-pass').value,err=document.getElementById('si-err');
  err.textContent=!mailOK(em)?'Enter a valid email address.':pw.length<6?'Password must be at least 6 characters.':'';
  if(!err.textContent)say('Signed in successfully');
};
forms.signup.onsubmit=e=>{
  e.preventDefault();const g=id=>document.getElementById(id).value,err=document.getElementById('su-err');
  err.textContent=!g('su-name').trim()?'Enter your full name.':!mailOK(g('su-email').trim())?'Enter a valid email address.':
    g('su-pass').length<6?'Password must be at least 6 characters.':g('su-pass')!==g('su-pass2')?'Passwords do not match.':
    !document.getElementById('su-terms').checked?'Accept the Terms & Privacy Policy to continue.':'';
  if(!err.textContent)say('Account created');
};

/* ---------- background: flowing gold ribbons ---------- */
const cv=document.getElementById('bg'),cx=cv.getContext('2d');let W,H,t=0;
function size(){const d=Math.min(devicePixelRatio||1,2);W=cv.width=innerWidth*d;H=cv.height=innerHeight*d;cx.setTransform(1,0,0,1,0,0)}
addEventListener('resize',size);size();
const COLORS=[['Ice blue','#a0c0d0'],['Pink','#ff7eb6'],['Red','#ff3b4e'],['White','#f5f5f5'],['Gold','#ffe627'],['Orange','#ff9f43'],['Green','#4ade80'],['Cyan','#22d3ee'],['Purple','#a78bfa']];
const hexRGB=h=>[1,3,5].map(i=>parseInt(h.slice(i,i+2),16));
const mix=(a,b,k)=>a.map((v,i)=>Math.round(v+(b[i]-v)*k));
const theme={hues:[[160,200,230],[80,135,190],[130,150,165],[35,52,68]],tint:[8,12,14]};
const swBox=document.getElementById('sw'),cc=document.getElementById('cc');
COLORS.forEach(([n,h])=>{const b=document.createElement('button');b.type='button';b.dataset.c=h;b.style.setProperty('--c',h);b.title=n;b.setAttribute('aria-label',n+' theme');b.onclick=()=>setTheme(h);swBox.appendChild(b)});
function setTheme(hex){
  hex=hex.toLowerCase();const c=hexRGB(hex),st=document.documentElement.style;
  st.setProperty('--yellow',hex);st.setProperty('--rgb',c.join(','));
  st.setProperty('--acc2','rgb('+mix(c,[255,255,255],.5).join(',')+')');
  st.setProperty('--yellow-glow','rgba('+c.join(',')+',.38)');
  theme.hues=[mix(c,[255,255,255],.25),mix(c,[0,0,0],.3),mix(c,[130,140,150],.45),mix(c,[0,0,0],.78)];
  theme.tint=mix([5,7,7],c,.1);
  swBox.querySelectorAll('button').forEach(b=>b.classList.toggle('on',b.dataset.c===hex));
  cc.value=hex;try{localStorage.setItem('login-theme',hex)}catch(e){}
}
cc.addEventListener('input',e=>setTheme(e.target.value));
let saved=null;try{saved=localStorage.getItem('login-theme')}catch(e){}
setTheme(/^#[0-9a-f]{6}$/i.test(saved||'')?saved:'#a0c0d0');
const ribbons=Array.from({length:22},(_,i)=>({
  y:.08+i*.042,amp:.09+((i*37)%11)/80,f:1.1+((i*13)%7)/9,ph:i*.55,w:1+((i*7)%5)*1.6,
  k:i%4,a:.16+((i*17)%6)/16
}));
const DPR=()=>W/innerWidth;
const flakes=Array.from({length:170},()=>{const z=Math.random();return{x:Math.random()*3000,y:Math.random()*2400,z,r:.7+z*z*3.6,v:.35+z*1.5,p:Math.random()*6.28,sw:.3+Math.random()*.9}});
function draw(){
  t+=.0035;cx.clearRect(0,0,W,H);
  const g=cx.createLinearGradient(0,0,W,H);g.addColorStop(0,`rgb(${theme.tint})`);g.addColorStop(.5,'#050707');g.addColorStop(1,`rgb(${theme.tint})`);
  cx.fillStyle=g;cx.fillRect(0,0,W,H);
  cx.globalCompositeOperation='lighter';
  for(const r of ribbons){
    cx.b
