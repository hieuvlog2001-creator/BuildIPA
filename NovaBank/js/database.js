const DB_KEY="novabank_demo_v1";
const seed={users:[
{id:"10000001",name:"Nguyễn Văn An",password:"123456",email:"an@example.com",phone:"0900000001",balance:12500000,status:"active",created:"2026-08-20",transactions:[
{time:"2026-08-29 06:20",note:"Số dư đầu kỳ",type:"credit",amount:12500000,balance:12500000}]},
{id:"10000002",name:"Trần Minh Anh",password:"123456",email:"anh@example.com",phone:"0900000002",balance:8200000,status:"active",created:"2026-08-21",transactions:[
{time:"2026-08-28 15:30",note:"Nạp tiền",type:"credit",amount:8200000,balance:8200000}]},
{id:"10000003",name:"Lê Hoàng Nam",password:"123456",email:"nam@example.com",phone:"0900000003",balance:3500000,status:"active",created:"2026-08-22",transactions:[
{time:"2026-08-27 10:00",note:"Nạp tiền",type:"credit",amount:3500000,balance:3500000}]}
]};
function loadDB(){let x=localStorage.getItem(DB_KEY);if(!x){localStorage.setItem(DB_KEY,JSON.stringify(seed));return structuredClone(seed)}return JSON.parse(x)}
function saveDB(db){localStorage.setItem(DB_KEY,JSON.stringify(db))}
function money(n){return new Intl.NumberFormat("vi-VN",{style:"currency",currency:"VND",maximumFractionDigits:0}).format(n)}
function now(){return new Date().toLocaleString("sv-SE").slice(0,16)}
function currentUser(){let id=sessionStorage.getItem("bank_user");return id?loadDB().users.find(u=>u.id===id):null}
function logout(){sessionStorage.clear();location.href="index.html"}
function esc(s){return String(s??"").replace(/[&<>"']/g,m=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[m]))}
