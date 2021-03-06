---
Problem Statement

ESP8266 panics while executing string.find(payload,...

This happens when LFS is loaded on flash even is dofile("_init.lua") is not called

---
Code Snippet

conn:on("receive", function(sck, payload)
  ...
_, _, method, url, vars = string.find(payload, "([A-Z]+) /([^?]*)%??(.*) HTTP")

---
Investigation

1. Create _payload2.lua (and _payload2_input.lua) to test with various payloads and ESP modules
2. Problem occurs when find searches to the end of payload (does not fulfill the 5 variable request).  
3. The larger the payload, the greater the chance of a panic. 
4. Test ESP8266s with and without LFS and always before dofile("_init.lua") (see _payload2_figure_1.png for raw results plot)
5. Results show that there is a 5.5x speed penalty for LFS (see _payload2_figure_2.png)
6. Results were consistent across different ESP8266 modules.  2 ESP8266 modules selected for LFS were of different vintages as were the 2 ESP8266s for normal mode (no LFS)

---
Questions

1. Does this imply that firmware functions are executed differently when LFS is opitonally added?
2. Is there a way to selectively load/run time critical functions in a different manner?

---
Other Details

1. online firmware build site
   https://nodemcu-build.com/
2. online luac.cross build site
   https://blog.ellisons.org.uk/article/nodemcu/a-lua-cross-compile-web-service/
   
---
Upon Request
1. LFS zip files
2. LFS img files
3. firmware images

---
Module Details

ESP8266_1 (no LFS)
NodeMCU version 0.9
...cu-build.com provided by frightanic.com
        branch: master
        commit: 310faf7fcc9130a296f7f17021d48c6d717f5fb6
        release: 3.0-master_20190907
        release DTS: 201909070945
        SSL: false
        build type: float
        LFS: 0x0
        modules: adc,bit,cron,dht,file,gpio,http,mqtt,net,node,ow,pwm2,rtcmem,rtctime,sntp,struct,tmr,uart,wifi
 build 2020-01-04 20:32 powered by Lua 5.1.4 on SDK 3.0.1-dev(fce080e)

ESP8266_10 (LFS)
ESP-12F (bare)
...cu-build.com provided by frightanic.com
        branch: master
        commit: 310faf7fcc9130a296f7f17021d48c6d717f5fb6
        release: 3.0-master_20190907
        release DTS: 201909070945
        SSL: false
        build type: float
        LFS: 0x0
        modules: adc,bit,cron,dht,file,gpio,http,mqtt,net,node,ow,pwm2,rtcmem,rtctime,sntp,struct,tmr,uart,wifi
 build 2020-01-04 20:32 powered by Lua 5.1.4 on SDK 3.0.1-dev(fce080e)

ESP8266_18 (LFS)
WeMos D1 mini
NodeMCU 3.0.0.0 built on nodemcu-build.com provided by frightanic.com
	branch: master
	commit: 71a182caa7841cbb478ed90ede526dc881943c80
	release: 
	release DTS: 202001061321
	SSL: false
	build type: float
	LFS: 0x20000
	modules: adc,bit,cron,dht,file,gpio,http,mqtt,net,node,ow,pwm2,rtcmem,rtctime,sntp,struct,tmr,uart,wifi
 build 2020-02-20 03:19 powered by Lua 5.1.4 on SDK 3.0.1-dev(fce080e)

ESP8266_19 (no LFS)
WeMos D1 mini
...cu-build.com provided by frightanic.com
        branch: master
        commit: 310faf7fcc9130a296f7f17021d48c6d717f5fb6
        release: 3.0-master_20190907
        release DTS: 201909070945
        SSL: false
        build type: float
        LFS: 0x0
        modules: adc,bit,cron,dht,file,gpio,http,mqtt,net,node,ow,pwm2,rtcmem,rtctime,sntp,struct,tmr,uart,wifi
 build 2020-01-04 20:32 powered by Lua 5.1.4 on SDK 3.0.1-dev(fce080e)
