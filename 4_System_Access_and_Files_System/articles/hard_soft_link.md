# روابط التشغيل السريعة في لينكس: اختصارات ذكية مع الإيموجي ✨

في عالم لينكس الرائع، توجد أدوات تسمى "الروابط" تساعدك على الوصول للملفات بسرعة واختصار الوقت. لكن يوجد نوعين من الروابط: الصلبة واللينة، ولكل منهما طريقة عمل مختلفة. لنستكشف ذلك معًا!

> **أولا: الرابط الصلب (Hard Link) - التوأم المتطابق **

- تخيل الملف الأصلي σαν شجرة ، والرابط الصلب هو نسخة طبق الأصل تشير لنفس الجذور (البيانات) .
- كلا الملف والأصل والرابط يمتلكان نفس بصمة التعريف (رقم العقدة) 🆔، مثل بصمة التوأمين المتطابقين!
- أي تعديل تقوم به على أحدهما سيظهر تلقائيًا في الآخر، فهما يشيران لنفس المعلومات .
- لا يمكن إنشاء روابط صلبة إلا لنفس نظام الملفات (مثل نفس القرص الصلب) .
- حذف الملف الأصلي لن يؤثر على الرابط، حيث سيظل بإمكانك الوصول للبيانات من خلاله .
- لا تستطيع إنشاء روابط صلبة للمجلدات ‍♂️.

> ** لننشئ رابط صلب: **

افتراضًا أن لديك ملفًا اسمه `صورة_ جميلة.jpg` ️، وأنت تريد رابطًا صلبًا له باسم `نسخة_ احتياطية.jpg` .

```bash
ln صورة_جميلة.jpg نسخة_احتياطية.jpg
```

- الأمر `ln` هو أداة إنشاء الروابط في لينكس.
- بعده، نضع اسم الملف الأصلي (`صورة_جميلة.jpg`) ثم اسم الرابط الجديد (`نسخة_احتياطية.jpg`).

> **ثانيًا: الرابط اللين (Soft Link) - السهم اللطيف ➡️**

- تخيل الرابط اللين σαν سهم ➡️ يشير إلى موقع الملف الأصلي، فهو اختصار وليس نسخة.
- كل من الرابط والملف الأصلي يمتلكان بصمات تعريف مختلفة (أرقام عقد) 🆔، مثل التوأمين غير المتطابقين.
- أي تعديل على الملف الأصلي سينعكس على الرابط، لكن العكس غير صحيح (تعديل الرابط لا يؤثر على الأصلي) .
- يمكنك إنشاء روابط لينة للملفات والمجلدات عبر أنظمة ملفات مختلفة (مفيد للأقراص الخارجية) .
- حذف الملف الأصلي سيجعل الرابط اللين لا يعمل لأنه يشير إلى ملف غير موجود (مثل سهم مشير إلى طريق مغلق ).

> ** لننشئ رابط لين: **

نفس مثال الملف `صورة_جميلة.jpg` ️، ولكن لننشئ رابطًا لينًا له على سطح المكتب باسم `اختصار_ للصورة.jpg` :

```bash
ln -s صورة_جميلة.jpg ~/سطح_المكتب/اختصار_للصورة.jpg
```

- العلم `-s` يخبر الأمر `ln` بأننا نريد إنشاء رابط لين (Soft Link).
- `~/سطح_المكتب/` يشير إلى مسار سطح المكتب الخاص بك.

الآن أصبح لديك اختصار سريع للوصول إلى صورتك الجميلة ✨. جرب واستمتع!
