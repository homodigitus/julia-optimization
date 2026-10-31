# Julia ile Optimizasyon Deneyleri

VS Code üzerinde Julia, JuMP ve HiGHS ile optimizasyon modelleri geliştirmek ve deneyleri GitHub'da takip etmek için başlangıç projesi.

## Yapı

```text
julia-optimization/
├── Project.toml             # Proje bağımlılıkları
├── experiments/             # Çalıştırılabilir deney dosyaları
├── src/                     # Yeniden kullanılabilir modeller
├── test/                    # Kontroller
├── data/                    # Paylaşılabilir örnek veriler
├── results/                 # Yerel çıktılar (Git'e eklenmez)
└── .vscode/                 # Eklenti önerisi
```

## 1. Gereksinimler

- [Julia](https://julialang.org/downloads/) (1.10 veya üzeri), [VS Code](https://code.visualstudio.com/) ve VS Code'da **Julia** eklentisi.
- [Git](https://git-scm.com/downloads) ve bir GitHub hesabı.

Repoyu klonlayıp `julia-optimization` klasörünü VS Code ile aç: **File → Open Folder**. VS Code terminalinde (`Terminal → New Terminal`) `julia --version` yaz. Komut bulunamazsa Julia kurulumunu ve PATH ayarını kontrol et, terminali yeniden aç.

## 2. Proje ortamını kur

VS Code terminalinde klasörün proje kökü olduğundan emin ol ve aşağıdaki komutu çalıştır:

```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

Windows PowerShell'de çift tırnak kullan:

```powershell
julia --project=. -e "using Pkg; Pkg.instantiate()"
```

İlk kurulum internet bağlantısı gerektirir ve birkaç dakika sürebilir. Julia paketleri ortak paket deposuna indirir; hangi paketlerin kullanılacağını bu klasördeki `Project.toml` ve oluşturulan `Manifest.toml` belirler. Bu, Python'daki gibi klasör içinde ayrı bir sanal ortam klasörü oluşturmaz. `Manifest.toml` ilk kurulumda oluşturulur ve tekrar üretilebilirlik için Git'e eklenebilir. Farklı Julia sürümleri ve işletim sistemlerinde uyumluluk değişebilir.

VS Code Julia REPL'i kullanırken `Ctrl+Shift+P` → **Julia: Start REPL** ile başlat. VS Code'un durum çubuğundaki Julia ortamına tıklayarak proje kökündeki `Project.toml` dosyasını seç. Ortam doğruysa REPL'de `Base.active_project()` proje yolunu gösterir. Aşağıdaki terminal komutları ortamı `--project=.` ile ayrıca açıkça seçer.

## 3. Örneği ve testleri çalıştır

```bash
julia --project=. experiments/01_uretim_planlama.jl
julia --project=. test/runtests.jl
```

Örnek, iki ürünün kârını iki kaynak kısıtı altında en yüksekler. Beklenen sonuç A = 20, B = 60 ve kâr = 2600'dür. Test aynı sonucu doğrular.

## 4. GitHub'a gönder

Bu repo GitHub'da zaten mevcut. Bilgisayarına almak için:

```bash
git clone https://github.com/homodigitus/julia-optimization.git
cd julia-optimization
```

Değişikliklerini göndermek için:

```bash
git add .
git commit -m "Yeni optimizasyon deneyi"
git push
```

Yeni denemeler için örneğin `git switch -c deney/arac-rotalama` ile branch açabilirsin. Parola, API anahtarı veya gizli müşteri verilerini depoya koyma. `data/private/` ve `results/` Git dışında tutulur; diğer `data/` dosyaları Git'e dahil edilir.

## 5. Yeni deneyler ve paketler

`experiments/` içine yeni bir `.jl` dosyası ekle. Ortak fonksiyonları `src/` içinde tut. İhtiyaç duyduğunda Julia REPL'de `]` tuşuna basıp paket moduna geç ve örneğin:

```julia
activate .
add CSV DataFrames
```

Backspace ile normal REPL'e dön. Paket eklemek `Project.toml` ve `Manifest.toml` dosyalarını günceller; değişiklikleri birlikte commit et. Deneylerinde amaç fonksiyonunu, kısıtları, veri kaynağını, çözücü ve parametrelerini, çalışma süresini ve sonucu kaydetmen karşılaştırmaları kolaylaştırır.
