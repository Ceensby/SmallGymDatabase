     Small Gym Database System – README

Bu proje, küçük ölçekli bir spor salonu (gym) yönetim sistemi için MSSQL veri tabanı tasarımı, ilişkisel şema, primary/foreign key ilişkileri, unique + check + default constraints, ve composite key içeren kapsamlı bir SQL yapısı sunar.

<h2> 1-Proje Amacı </h2>

Bu veritabanı, bir spor salonunun:
<ul>
<li>
  Üyelerini (UserTable)
</li>
<li>
  Eğitmenlerini (TrainerTable)
</li>
<li>
  Ödeme bilgilerini (PaymentTable)
</li>
<li>
  Giriş bilgilerini (LoginTable)
</li>
<li>
  Gym özelliklerini (GymTable)
</li>
<li>
  Yetki modüllerini (PermissionTable)
</li>  
</ul>

yönetebilmesi için tasarlanmıştır.

<h2> 2-Database Diyagramı  </h2>
Aşağıda projenin ilişkisel veri modeli bulunmaktadır:

<img width="600" height="400" alt="SmallGymDatabaseDiagram" src="https://github.com/user-attachments/assets/f43746c1-fa6a-48de-8107-28cf7540a284" />

<h2> 3-Kullanılan SQL Dosyaları </h2>

<h3> 1. CreateTables.sql </h3>

Bu dosyada tüm tabloların oluşturulması için gerekli komutlar bulunmaktadır:

PK (Primary Key) tanımları

FK (Foreign Key) ilişkileri

Unique Constraints

Identity kolonları

İçerdiği tablolar:
<ul>
  <li>
    UserTable	// Üyeler
  </li>
  <li>
    LoginTable //	Kullanıcı giriş bilgileri
  </li>
  <li>
    PaymentTable //	Ödeme kayıtları 
  </li>
  <li>
    TrainerTable //	Eğitmen kayıtları
  </li>
  <li>
    GymTable //	Salon bilgileri
  </li>
  <li>
    PermissionTable	// Yetki modülleri
  </li>
</ul>

Önemli Özellikler:

GymTable.GymId → identity(200,1)

PermissionTable.PermissionId → identity(300,1)

PaymentTable (PaymentId + CustomerId) → Composite Primary Key

<h3> 2. Constraints.sql </h3>


Bu dosya, veri doğruluğunu garanti eden tüm CHECK ve DEFAULT constraint’leri içerir.

<h4> Check Constraints </h4>

<ul>
  <li>
   LoginTable => LoginPassword  <br>	Büyük harfle başlamalı, en az 2 rakam içermeli
  </li>
  <li>
  PermissionTable => PermissionModule  <br>	Sayı içeremez
  </li>
  <li>
  GymTable =>  GymType  <br>	Sayı içeremez
  </li>
  <li>
  UserTable  =>  UserName   <br> 	Sayı içeremez
  </li>
  <li>
  UserTable  =>  UserEmail   <br> '@' içerme zorunluluğu
  </li>
  <li>
   PaymentTable =>  PaymentAmount   <br> 	0 – 100000 arası
  </li>
  <li>
   PaymentTable  =>  PaymentDate   <br> 	Gelecekte olamaz
  </li>
  <li>
   TrainerTable => 	TrainerPassword    <br> En az 1 büyük harf + 2 rakam
  </li>
</ul>

<h4> Default Constraints </h4>

UserTable	// UserAddress	'No'

TrainerTable //	TrainerAddress	'No'

GymTable // GymAddress	'No'

PaymentTable	// PaymentDescription	'No'

Bu kurallar, veritabanının standartlara uygun, güvenli ve temiz veri tutmasını sağlar.


<h2> 4- Tablolar Arası İlişkiler  </h2>

UserTable ↔ TrainerTable → Her üyenin bir eğitmeni olabilir.

UserTable ↔ GymTable → Her üye bir salona bağlıdır.

GymTable ↔ PermissionTable → Her salonun bir modülü vardır.

LoginTable ↔ UserTable → Kullanıcı giriş bilgileri.

PaymentTable ↔ UserTable → Ödeme yapan kullanıcı ilişkisi (Composite Key kullanır).


<h2> 5- Önemli Tasarım Notları   </h2>

  PaymentTable, çoğu sistemde yaygın olmayan bir tasarım olan Composite PK (PaymentId + CustomerId) yapısına sahiptir.
Bu sayede aynı kullanıcının birden fazla ödemesi, PaymentId çakışmadan tutulabilir.
<hr>

 Şifre alanlarına farklı tablolar için güçlü parola kuralları tanımlanmıştır.

<h2> 6- Kullanım  </h2>

Bu projeyi kullanmak için:

     USE GymDB;
     GO

    -- 1. CreateTables.sql dosyasını çalıştırın
    -- 2. Constraints.sql dosyasını çalıştırın
    -- 3. (Opsiyonel) DummyData.sql çalıştırılacak

Veritabanı hazır hale gelir.

<h2> 7-Dummy Data </h2>
Dummy veri dosyasının eski sürümüne ulaşabilirsiniz ama bu sadece dosyanızın ilk halinde işe yarar.
<br>
Şuanda yüklü olan Dummy dosyası güncellenecektir.

<h2> 8-Lisans </h2>

Bu proje tamamen eğitim amaçlı olarak hazırlanmıştır. İçerisindeki tablo yapıları, constraint’ler ve ilişkisel model; veri tabanı tasarımı konusundaki teknik becerilerimi geliştirmek ve uygulamalı bir örnek oluşturmak için kurgulanmıştır.

Ayrıca bu çalışma, ilerleyen süreçte geliştirilecek olan ana University Database projesinin bir öncüsü ve temel hazırlığı niteliğindedir. Buradaki yapı, üniversite sistemine geçiş yapmadan önce daha küçük ve sade bir mimari üzerinde ilişki mantığını, anahtar yapılarını, check/default kurallarını ve veri bütünlüğünü test etmek amacıyla oluşturulmuş daha basit bir modeldir.

Gerçek projeye başlamadan önce tasarım prensiplerini belirlemek, olası hataları görmek ve yaklaşımları netleştirmek için “örnek çalışma” olarak paylaşılmıştır. Bu nedenle nihai bir ürün değil; daha kapsamlı veritabanı sistemine zemin hazırlayan bir hazırlık ve prototip aşaması olarak değerlendirilebilir.

<h2> 9-İletişim </h2>

Eğer bu projeyi incelemek istersen:

Birincil-Email: Cbektas12@outlook.com
<br>
Formal-Email: Cansubektas@stu.topkapi.edu.tr
<br>
LinkedIn: Cansu Bektaş


