-- Plugin Information
script_name = "SubGene Effect Plugin"
script_description = "Quickly create advanced subtitle effects"
script_author = "ARobin"
script_version = "0.20"

local effect_categories = {
    {name="Particle Effects", key="particle"},
    {name="Font & Style", key="font"},
    {name="Simple Animation", key="anim"},
    {name="Templates", key="template"},
    {name="Custom", key="custom"}
}

-- Templates 子菜单
local template_sub_effects = {
    "Karaoke Particle Art 1",
    "Karaoke Particle Art 2",
    "Simple Karaoke Timing",
    "Back"
}


-- 纯文本批量粘贴
function show_karaoke_template()
    local a = [[
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code once,heart = {"m -14 8 b -7 -7 2 3 0 11 b 0 15 -14 26 -14 28 b -14 26 -28 15 -28 11 b -30 3 -21 -7 -14 8 "}; circle = {"m 18 3 b 22 7 22 14 18 18 b 14 22 7 22 3 18 b -1 14 -1 7 3 3 b 7 -1 14 -1 18 3 "}; ring = {"m 18 3 b 22 7 22 14 18 18 b 14 22 7 22 3 18 b -1 14 -1 7 3 3 b 7 -1 14 -1 18 3 m 4 4 b 1 7 1 14 4 17 b 7 19 14 19 17 17 b 20 14 20 7 17 4 b 14 2 7 2 4 4 "}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template noblank notext,!retime("syl",0,1000)!{\an5\pos($center,!$middle+45!)\fad(0,800)\frx72\bord0\blur5\be5\c&H7B7B7B&\fscx350\fscy350\t(\fscx500\fscy500)\p1}!circle[1]!
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template noblank notext,!retime("syl",0,1000)!{\an5\pos($center,!$middle+45!)\fad(0,800)\frx72\bord0\blur2.5\c&H8728B4&\fscx250\fscy250\t(\fscx400\fscy400\c&H500076&)\alpha&H23&\p1}!circle[1]!
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template noblank notext,!retime("syl",0,1000)!{\an5\pos($center,!$middle+45!)\fad(0,800)\frx72\bord0\blur3\xblur5\be7\c&HB527FF&\fscx450\fscy490\t(\fscx600\fscy640)\alpha&H35&\p1}!ring[1]!
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template noblank notext,!retime("syl",-1000,0)!{\an5\move($center,!$middle-90!,$center,!$middle+10!,0,1000)\org(!$center+10!,$middle)\fad(350,200)\blur2\c&HFFFFFF&\3c&HD586FF&\fscx50\fscy50\t(fscx120\fscy120)\t(0,2500,\fry1700)\p1}!heart[1]!
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template,!retime("start2syl",-800,0)!{\an5\move(!$center+math.random(-50,50)!,!$middle+math.random(-50,50)!,$center,$middle,0,600)\fad(300,0)\fscx170\fscy170\c&HFFFFFF&\3c&HD586FF&\blur3\t(0,300,\fscx100\fscy100)}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template,!retime("start2syl",-800,0)!{\an5\pos($center,!$middle+90!)\alpha&H75&\frx180\c&HFFFFFF&\3c&HD586FF&\blur3\fscx100\fscy100\alpha&HFF&\t(799,800,\alpha&H75&)}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template,!retime("syl",0,0)!{\an5\pos($center,$middle)\c&HFFFFFF&\3c&HD586FF&\blur4\bord4\t(0,10,\fscy140\blur20\b1\bord8)\t(10,$dur,\fscy100\blur4\b0\bord4)}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template,!retime("syl",0,0)!{\an5\pos($center,!$middle+90!)\alpha&H75&\frx180\c&HFFFFFF&\3c&HD586FF&\blur4\bord4\t(0,10,\fscy140\blur20\b1\bord8)\t(10,$dur,\fscy100\blur4\b0\bord4)}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template,!retime("syl2end",0,-300+syl.i*60)!{\an5\pos($center,$middle)\fad(0,200)\c&HFFFFFF&\3c&HD586FF&\blur4\bord4}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,template,!retime("syl2end",0,-300+syl.i*60)!{\an5\pos($center,!$middle+90!)\alpha&H75&\frx180\fad(0,200)\c&HFFFFFF&\3c&HD586FF&\blur4\bord4}
Dialogue: 0,0:00:00.00,0:00:10.00,Default,,0,0,0,,
Dialogue: 0,0:00:10.00,0:00:20.00,Default,,0,0,0,,
Dialogue: 0,0:00:20.00,0:00:30.00,Default,,0,0,0,,
]]
    -- 直接插入整体文本为一行到字幕顶部
    aegisub.dialog.display({{
        class="textbox",
        name="karaoke",
        label = "Please press Ctrl+A to select all, then Ctrl+C to copy, and paste at the top of your subtitles with Ctrl+V.",
        value = a,
        width=100,
        height=15
    }}, {"OK"})
end


function show_karaoke_template2()
    local a = [[
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code once,temp = {} temp.score_width = 100
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code once,function set_temp(ref,val) temp[ref] = val; return val; end
Comment: 0,0:00:00.00,0:00:00.00,Default,score height self adjust,0,0,0,code line,score_size = math.floor(line.styleref.fontsize/2.5)
Comment: 0,0:00:00.00,0:00:05.00,Default,score height self adjust,0,0,0,code line,shape = string.format("m 0 0 l 100 0 l 100 -1 l 0 -1 m 0 %d l 100 %d l 100 %d l 0 %d m 0 %d l 100 %d l 100 %d l 0 %d m 0 %d l 100 %d l 100 %d l 0 %d m 0 %d l 100 %d l 100 %d l 0 %d",score_size,score_size,score_size+1,score_size+1,score_size*2,score_size*2,score_size*2+1,score_size*2+1,score_size*3,score_size*3,score_size*3+1,score_size*3+1,score_size*4,score_size*4,score_size*4+1,score_size*4+1)
Comment: 0,0:00:00.00,0:00:00.00,Default,score,0,0,0,template pre-line notext noblank,!retime("line",-1000,-500)!{\an5\bord0.5\shad0\pos($lcenter,$lmiddle)\fscx!temp.score_width!\t(0,300,\fscx!130*$lwidth/100!)\t(300,600,\fscx!set_temp("score_width",110*$lwidth/100)!)\3c&HFFFFFF&\t(0,100,\bord2\blur3)\t(100,1200,\bord0.5\blur0)\p1}!shape!
Comment: 0,0:00:00.00,0:00:00.00,Default,lead-in,0,0,0,template,!retime("start2syl",-1000+syl.i*50,0)!{\an5\pos($center,$middle)\fad(300,0)}
Comment: 0,0:00:00.00,0:00:00.00,Default,hilight(note),0,0,0,template notext noblank,!retime("presyl",-500,0)!{\an5\fscx60\fscy60\move(!$center+50!,!$middle-50!,$center,$middle)\3c!set_temp("color",_G.ass_color(math.random(255),math.random(255),math.random(255)))!\fad(300,0)\t(0,500,0.7,\fr360\fscx100\fscy100)}♪
Comment: 0,0:00:00.00,0:00:00.00,Default,hilight(char),0,0,0,template noblank,!retime("presyl",0,500)!{\an5\fad(0,300)\move($center,$middle,!$center-50!,!$middle-50!)\3c!temp.color!\t(0,500,1.3,\fr360\fscx60\fscy60)}
Comment: 0,0:00:00.00,0:00:00.00,Default,hilight & lead-out(note),0,0,0,template notext noblank,!retime("syl2end",-$dur,-$syln*100+syl.i*100)!{\an5\move($center,$middle,$center,!$middle+score_size*math.random(-2,1)!,0,$dur)\fad(0,300)\3c!temp.color!}♪
Dialogue: 0,0:00:00.00,0:00:10.00,Default,,0,0,0,,
Dialogue: 0,0:00:10.00,0:00:20.00,Default,,0,0,0,,
Dialogue: 0,0:00:20.00,0:00:30.00,Default,,0,0,0,,
]]


aegisub.dialog.display({
    {
        class = "textbox",
        name = "karaoke2",
        label = "Please press Ctrl+A to select all, then Ctrl+C to copy, and paste at the top of your subtitles with Ctrl+V.",
        value = a,
        width = 100,
        height = 15
    }
}, {"OK"})
end


--  均分卡拉OK轴功能
local function utf8_chars(str)
    local chars = {}
    local i = 1
    local len = #str
    while i <= len do
        local c = str:byte(i)
        local n = 1
        if c >= 0xF0 then n = 4
        elseif c >= 0xE0 then n = 3
        elseif c >= 0xC0 then n = 2 end
        table.insert(chars, str:sub(i, i+n-1))
        i = i + n
    end
    return chars
end

function insert_simple_karaoke(subtitles, selected_lines)
    for _, si in ipairs(selected_lines) do
        local line = subtitles[si]
        if line.class ~= "dialogue" then goto continue end
        local text = line.text:gsub("{.-}", "")
        local chars = utf8_chars(text)
        local syl_n = #chars
        if syl_n == 0 then goto continue end
        local duration = (line.end_time - line.start_time)
        local ktime = math.floor(duration / 10 / syl_n + 0.5) -- {\kxx}，0.01秒单位
        local newtext = ""
        for i, ch in ipairs(chars) do
            newtext = newtext .. string.format("{\\k%d}%s", ktime, ch)
        end
        line.text = newtext
        subtitles[si] = line
        ::continue::
    end
    aegisub.dialog.display({{class="label",label="A simple karaoke track (equal distribution per character) has been generated!"}},{"OK"})
end



local particle_sub_effects = {
    "Snow Effect",
    "Back"
}

function Snow_effect()
    local a = [[
Comment: 0,0:00:00.00,0:00:00.00,Default,▼CODE LINES▼,0,0,0,karaoke,put "meteor" in the actor field to show a shooting star^^
Comment: 0,0:00:00.00,0:00:00.00,Default,Get Scr Resolution,0,0,0,code once,xres, yres = _G.aegisub.video_size() ratio = meta.res_y/720  if (xres and xres ~= meta.res_x) or (yres and yres ~= meta.res_y) then _G.aegisub.debug.out(2, "Warning: script resolution %dx%d does not match with loaded video resolution %dx%d resample script resolution(menu>subtitles>resample resolution>click from video)", meta.res_x, meta.res_y, xres, yres) end
Comment: 0,0:00:00.00,0:00:00.00,Default,Get Frame Dur,0,0,0,code once,msa = _G.aegisub.ms_from_frame(1) msb = _G.aegisub.ms_from_frame(101) if msa == nil and msb == nil then _G.aegisub.debug.out(2, "Warning: Please load the video or use dummy video.Frame duration was provisionally set to 33 milliseconds. ") frame_dur = 33  else frame_dur = (msb-msa)/100 end
Comment: 3,0:00:00.00,0:00:00.00,Default,,0,0,0,code once,shape = {} shape ={"{\\p1\\1c&H0000FF&}m 18 9 l 48 0 l 60 23 b 66 30 49 38 41 40 b 30 43 14 41 18 34 l 18 10","{\\1c&HFFFFFF&\\p1}m 48 22 b 77 21 92 75 46 79 b 3 78 9 21 47 22","{\\1c&HFFFFFF&\\p1}m 47 59 b 108 65 92 133 47 132 b -1 130 -3 61 46 59","{\\p1\\1c&H40E1F9&}m 3 60 b 9 68 17 73 24 78 b 26 79 24 81 22 80 b 18 77 15 75 11 73 b 7 75 0 76 0 73 b 1 71 6 72 9 71 b 6 68 3 65 1 61","{\\p1\\1c&H000000&}m 0 0 m 38 48 b 34 49 34 55 39 55 b 42 54 44 49 38 48 m 64 44 b 69 45 69 51 64 51 b 60 51 60 44 64 44 m 47 60 b 53 60 58 60 63 60 b 66 64 57 63 49 63 b 46 63 47 61 47 60"}
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code syl all,fxgroup.firstsyl = (syl.i == 1)
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code line all,fxgroup.shootingstar = line.actor == "meteor"
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code once,temp = {} function set_temp(ref,val) temp[ref] = val return val end
Comment: 0,0:00:00.00,0:00:00.00,Default,Glitter Effects Function,0,0,0,code once,function glitter(dur,scale)  if (dur > 800) then tag =  string.format("\\t(%d,%d,\\fscx%d\\fscy%d)\\t(%d,%d,\\fscx%d\\fscy%d)\\t(%d,%d,\\fscx%d\\fscy%d)\\t(%d,%d,\\fscx%d\\fscy%d)",set_temp("time",math.random(dur)),temp.time+1,set_temp("size",math.random(100,200)),temp.size,temp.time+2,temp.time+100,50,50,temp.time+101,temp.time+102,set_temp("size",math.random(100,200)),temp.size,temp.time+103,temp.time+200,scale,scale) return tag else return "" end end
Comment: 0,0:00:00.00,0:00:00.00,Default,stripe function,0,0,0,code once,function xmas_stripe(width) tag = "" stripe = 15 while stripe < width+15 do tag = tag..string.format("m %d %d l %d %d l %d %d l %d %d ",line.left+stripe,line.top,line.left+stripe+15,line.top,line.left+stripe-15,line.bottom,line.left+stripe-15-15,line.bottom) stripe = stripe + 30 end return tag end
Comment: 0,0:00:00.00,0:00:00.00,Default,Beizer Curve Move,0,0,0,code once all,function bezier_move(x1,y1,x2,y2,x3,y3,x4,y4,t1,t2,accel,afterimage_blur,afterimage_dur,density) if density == 0 or density == nil then density = 1 end if afterimage_blur == 0 or afterimage_blur == nil then x_blur = 0 y_blur = 0 else x_blur = math.random(-afterimage_blur,afterimage_blur) y_blur = math.random(-afterimage_blur,afterimage_blur) end if afterimage_dur == nil or afterimage_dur < frame_dur then afterimage_dur = frame_dur end  if accel == nil then accel = 1 end x_pos = {} y_pos = {} dur = t2 - t1 frames = math.floor(dur/(frame_dur/density)) x_pos[j] =  (1-(j/frames)^accel)^3 * x1 + 3*(1-(j/frames)^accel)^2 * ((j/frames)^accel) * x2 + 3*(1-(j/frames)^accel) * ((j/frames)^accel)^2 * x3 + ((j/frames)^accel)^3 * x4  y_pos[j] = (1-(j/frames)^accel)^3 * y1 + 3*(1-(j/frames)^accel)^2 * ((j/frames)^accel) * y2 + 3*(1-(j/frames)^accel) * ((j/frames)^accel)^2 * y3 + ((j/frames)^accel)^3 * y4  if j == 1 then maxloop(frames) end retime("preline",t1+(j-1)*(frame_dur/density),t1+j*(frame_dur/density)+afterimage_dur) return string.format("\\move(%d,%d,%d,%d)",x_pos[j],y_pos[j],x_pos[j] + x_blur ,y_pos[j] + y_blur) end
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code line,if line.styleref.align == 1 or line.styleref.align == 4 or line.styleref.align == 7 then align = "left" elseif line.styleref.align == 2 or line.styleref.align == 5 or line.styleref.aling == 8 then align = "center" else align = "right" end
Comment: 0,0:00:00.00,0:00:00.00,Default,inter line duration,0,0,0,code once,preline_end_time = {} preline_line_center = {}  line_counter =2
Comment: 0,0:00:00.00,0:00:00.00,Default,inter line duration,0,0,0,code line,preline_end_time[1] = line.start_time-1500 line_counter = line_counter + 1 if preline_end_time[line_counter-2] == line.end_time then  inter_line = line.start_time - preline_end_time[line_counter-3]   preline_end_time[line_counter-1] = line.end_time else preline_end_time[line_counter-1] = line.end_time  inter_line = line.start_time - preline_end_time[line_counter-2] end if inter_line > 4000 then inter_line = 1000 end if inter_line < 0 then inter_line = 0 end
Comment: 0,0:00:00.00,0:00:00.00,Default,,0,0,0,code line,fxgroup.nonbreakline = preline_end_time[line_counter-2] ~= line.end_time
Comment: 0,0:00:00.00,0:00:00.00,Default,▼TEMPLATE LINES▼,0,0,0,karaoke,
Comment: 0,0:00:00.00,0:00:00.00,Default,▼trans▼,0,0,0,karaoke,
Comment: 5,0:00:00.00,0:00:00.00,Default,text red,0,0,0,template pre-line,!retime("line",0,0)!{\an5\pos($center,!$middle-60!)\bord3\blur2\1c&H6E72FF&\3c&H000000&\shad0\clip(!xmas_stripe(line.width)!)\fad(300,300)}
Comment: 4,0:00:00.00,0:00:00.00,Default,text green,0,0,0,template pre-line,!retime("line",0,0)!{\an5\pos($center,!$middle-60!)\bord3\blur2\1c&H87FFAA&\3c&H000000&\shad1\4c&H00FFF7&\fad(300,300)}
Comment: 7,0:00:00.00,0:00:00.00,Default,snow effect,0,0,0,template pre-line,!maxloop(($ldur+inter_line)/15)!!retime("preline",-inter_line+(j-1)*15,-inter_line+j*15+3000)!{\fad(1000,1000)\an!math.random(1,9)!\t(\frz!math.random(720)!)\fscx!set_temp("scx",math.random(5,40))*0.75*meta.res_y/720!\fscy!temp.scx*0.75*meta.res_y/720!\move(!set_temp("SX",math.random(line.left,line.right))+math.random(40,100)*meta.res_x/1280!,!set_temp("SY",line.top-math.random(meta.res_y*0.1,meta.res_y*0.2))!,!temp.SX!,!line.top!)\shad0\bord0\blur2\1c&HFFFFFF&\p1}m 19 4 b 23 8 23 15 19 19 b 15 23 8 23 4 19 b 0 15 0 8 4 4 b 8 0 15 0 19 4
Comment: 1,0:00:00.00,0:00:00.00,Default,moon border,0,0,0,template pre-line fxgroup nonbreakline,!retime("line",-inter_line,0)!{\an5\pos(!align == "left" and $lleft+100*ratio or (align == "center" and $lcenter+250*ratio  or $lright-100*ratio)!,!$bottom-150*ratio!)\bord10\blur30\3c&HFFFFFF&\shad0\fscx150\fscy150\1c&HFFFFFF&\p1}m 19 4 b 23 8 23 15 19 19 b 15 23 8 23 4 19 b 0 15 0 8 4 4 b 8 0 15 0 19 4
Comment: 1,0:00:00.00,0:00:00.00,Default,star,0,0,0,template pre-line loop 10,!retime("line",-inter_line,0)!{\an5\pos(!math.random($lleft,$lright)!,!math.random($top-100*ratio,$top-50*ratio)!)\bord0\shad0\blur1\fscx!set_temp("scx",math.random(50,100))!\fscy!temp.scx!\frz45\1c&H5AFDF7&!glitter(line.duration,temp.scx)!\fad(300,300)\p1}m 20 0 b 20 22 18 20 40 20 b 18 20 20 18 20 40 b 20 18 22 20 0 20 b 22 20 20 22 20 0
Comment: 0,0:00:00.00,0:00:00.00,Default,shooting star,0,0,0,template pre-line fxgroup shootingstar,{\an5!bezier_move($lright,$lmiddle-120*ratio,$lright-$lwidth/3,$lmiddle-113*ratio,$lleft+$lwidth/3,$lmiddle-107*ratio,$lleft,$lmiddle-100*ratio,0,3000,1.2,10,1000,1)!\4a&HFF&\1c&HFFFFFF&\fad(0,500)\fscx!set_temp("scx",math.random(20,60)*ratio)!\fscy!temp.scx!\blur2\3c!j == 1 and set_temp("color",_G.ass_color(math.random(255),math.random(255),math.random(255))) or temp.color!\3a&H80&\p1}m 5 0 b 2 0 0 2 0 5 b 0 8 2 10 5 10 b 8 10 10 8 10 5 b 10 2 8 0 5 0
Dialogue: 0,0:00:00.00,0:00:10.00,Default,,0,0,0,,
Dialogue: 0,0:00:10.00,0:00:20.00,Default,,0,0,0,,
Dialogue: 0,0:00:20.00,0:00:30.00,Default,,0,0,0,,

]]
    aegisub.dialog.display({{
        class="textbox",
        name="snow",
        label = "Please press Ctrl+A to select all, then Ctrl+C to copy, and paste at the top of your subtitles with Ctrl+V.",
        value = a,
        width=100,
        height=15
    }}, {"OK"})
end





local font_style_subcategories = {
    "Font Size & Layout",
    "Position & Alignment"
}

local font_size_list = {
    "Font for 720p (HD)",
    "Font for 1080p (FHD)",
    "Font for 4K (UHD)",
    "Font for 720p Vertical",
    "Font for 1080p Vertical",
    "Font for 4K Vertical",
    "Back"
}

local font_presets = {
    ["Font for 720p (HD)"]         = {size=72,  vertical=false},
    ["Font for 1080p (FHD)"]       = {size=108, vertical=false},
    ["Font for 4K (UHD)"]          = {size=216, vertical=false},
    ["Font for 720p Vertical"]     = {size=72,  vertical=true },
    ["Font for 1080p Vertical"]    = {size=108, vertical=true },
    ["Font for 4K Vertical"]       = {size=216, vertical=true }
}

local font_alignments = {
    ["Top Left"]      = {align=7},
    ["Top Center"]    = {align=8},
    ["Top Right"]     = {align=9},
    ["Middle Left"]   = {align=4},
    ["Middle Center"] = {align=5},
    ["Middle Right"]  = {align=6},
    ["Bottom Left"]   = {align=1},
    ["Bottom Center"] = {align=2},
    ["Bottom Right"]  = {align=3}
}
local font_alignment_list = {
    "Top Left", "Top Center", "Top Right",
    "Middle Left", "Middle Center", "Middle Right",
    "Bottom Left", "Bottom Center", "Bottom Right",
    "Vertical Margin +10px",
    "Horizontal Margin +10px",
    "Back"
}

local anim_type_list = {
    "Rotation", "Fade In/Out", "Back"
}
local rotation_list = {
    "Clockwise (Head Anchor)",
    "Clockwise (Center Anchor)",
    "Clockwise (Tail Anchor)",
    "Counterclockwise (Head Anchor)",
    "Counterclockwise (Center Anchor)",
    "Counterclockwise (Tail Anchor)",
    "Back"
}
local fade_list = {
    "Fade In Only", "Fade Out Only", "Fade In + Fade Out", "Back"
}
local anim_anchors = {
    ["Head"] = 4,
    ["Center"] = 5,
    ["Tail"] = 6
}

local function to_vertical(text)
    local out = ""
    local i = 1
    while i <= #text do
        local c = text:sub(i, i)
        if c == "{" then
            local tag = text:match("{[^}]*}", i)
            out = out .. tag
            i = i + #tag
        else
            local chars = utf8_chars(text:sub(i))
            if #chars > 0 then
                out = out .. chars[1] .. "\\N"
                i = i + #chars[1]
            else
                i = i + 1
            end
        end
    end
    out = out:gsub("\\N$", "")
    return out
end

function apply_font_style(subtitles, selected_lines, effect_name)
    local preset = font_presets[effect_name]
    if not preset then return end
    for _, i in ipairs(selected_lines) do
        local line = subtitles[i]
        local text_content = line.text
        local changed = false
        text_content = text_content:gsub("({.-\\)fs%d+", function(prefix)
            changed = true
            return prefix .. "fs" .. preset.size
        end)
        if not changed then
            text_content = "{\\fs"..preset.size.."}" .. text_content
        end
        if preset.vertical then
            local q2_found = false
            text_content = text_content:gsub("({.-\\)q%d+", function(prefix)
                q2_found = true
                return prefix .. "q2"
            end)
            if not q2_found then
                text_content = text_content:gsub("^{", "{\\q2", 1)
            end
            local tags, body = text_content:match("^({[^}]*})(.*)")
            if tags and body then
                body = to_vertical(body)
                text_content = tags .. body
            else
                text_content = to_vertical(text_content)
            end
        end
        line.text = text_content
        subtitles[i] = line
    end
    aegisub.debug.out("Font effect [%s] has been applied to the selected lines.\n", effect_name)
end

function apply_font_alignment(subtitles, selected_lines, effect_name)
    local param = font_alignments[effect_name]
    if not param then return end
    for _, i in ipairs(selected_lines) do
        local line = subtitles[i]
        local changed = false
        line.text = line.text:gsub("({.-\\)an%d+", function(prefix)
            changed = true
            return prefix .. "an" .. param.align
        end)
        if not changed then
            line.text = "{\\an"..param.align.."}" .. line.text
        end
        subtitles[i] = line
    end
    aegisub.debug.out("Alignment ["..effect_name.."] has been applied to the selected lines.\n")
end

function increase_vertical_margin(subtitles, selected_lines, amount)
    for _, i in ipairs(selected_lines) do
        local line = subtitles[i]
        line.margin_v = (tonumber(line.margin_v) or 0) + (amount or 10)
        subtitles[i] = line
    end
    aegisub.debug.out("Vertical margin +%dpx applied to the selected lines.\n", amount or 10)
end

function increase_horizontal_margin(subtitles, selected_lines, amount)
    for _, i in ipairs(selected_lines) do
        local line = subtitles[i]
        line.margin_l = (tonumber(line.margin_l) or 0) + (amount or 10)
        line.margin_r = (tonumber(line.margin_r) or 0) + (amount or 10)
        subtitles[i] = line
    end
    aegisub.debug.out("Horizontal margin +%dpx applied to the selected lines.\n", amount or 10)
end

function apply_custom_rotation(subtitles, selected_lines, anim_name, seconds)
    local anchor
    local clockwise = anim_name:find("Clockwise")
    if anim_name:find("Head") then
        anchor = anim_anchors["Head"]
    elseif anim_name:find("Center") then
        anchor = anim_anchors["Center"]
    else
        anchor = anim_anchors["Tail"]
    end
    local duration = math.max(1, tonumber(seconds) or 5) * 1000
    local total_angle = clockwise and 10000 or -10000  -- 角度
    for _, i in ipairs(selected_lines) do
        local line = subtitles[i]
        -- 保证对齐锚点
        line.text = line.text:gsub("({.-\\)an%d+", function(prefix)
            return prefix .. "an" .. anchor
        end)
        if not line.text:find("\\an%d") then
            line.text = "{\\an"..anchor.."}" .. line.text
        end
        -- 移除已有的旋转和动画
        line.text = line.text:gsub("\\frz[%d%-%.]+", "")
        line.text = line.text:gsub("\\t%([^)]+\\frz[%-]?%d+%)", "")
        -- 插入顺序：{\,frz0\,t(0,xxx,\frzangle)}
        line.text = line.text:gsub("^{", string.format("{\\frz0\\t(0,%d,\\frz%d)", duration, total_angle), 1)
        subtitles[i] = line
    end
    aegisub.debug.out("Rotation [%s] applied: %ds (%d°)\n", anim_name, seconds, total_angle)
end


function apply_fade(subtitles, selected_lines, fadein, fadeout)
    aegisub.debug.out("apply_fade called, lines: %d\n", #selected_lines)
    for _, i in ipairs(selected_lines) do
        local line = subtitles[i]
        if line.class == "dialogue" then
            aegisub.debug.out("Before: %s\n", line.text)
            -- 去除已有的 \fad
            line.text = line.text:gsub("\\fad%([%d%, ]+%)", "")
            -- 判断首位是否为特效标签，否则强制加在最前面
            if line.text:match("^{") then
                line.text = line.text:gsub("^{", string.format("{\\fad(%d,%d)", fadein or 0, fadeout or 0), 1)
            else
                line.text = string.format("{\\fad(%d,%d)}%s", fadein or 0, fadeout or 0, line.text)
            end
            aegisub.debug.out("After: %s\n", line.text)
            subtitles[i] = line
        end
    end
end


-- 主菜单
function select_category(subtitles, selected_lines)
    local buttons = {}
    for i, cat in ipairs(effect_categories) do
        table.insert(buttons, cat.name)
    end
    table.insert(buttons, "Cancel")
    local dialog = {
        {class="label", label="SubGene Effect Plugin"},
        {class="label", label="Select a Category:"}
    }
    local btn = aegisub.dialog.display(dialog, buttons)
    if btn == "Cancel" or btn == nil then return end
    local selected_key = nil
    for i, cat in ipairs(effect_categories) do
        if btn == cat.name then
            selected_key = cat.key
            break
        end
    end
    select_sub_effect(subtitles, selected_lines, selected_key)
end

function select_sub_effect(subtitles, selected_lines, category_key)
    if category_key == "template" then
        local btn = aegisub.dialog.display(
            {
                {class="label", label="Templates"},
                {class="label", label="Select a Template:"}
            },
            template_sub_effects
        )
        if btn == "Back" or btn == nil then return select_category(subtitles, selected_lines) end
        if btn == "Karaoke Particle Art 1" then
            show_karaoke_template()
            return select_category(subtitles, selected_lines)
        elseif btn == "Karaoke Particle Art 2" then
            show_karaoke_template2()
            return select_category(subtitles, selected_lines)
        elseif btn == "Simple Karaoke Timing" then
            insert_simple_karaoke(subtitles, selected_lines)
            return select_category(subtitles, selected_lines)
        end
        return select_category(subtitles, selected_lines)
    end


    if category_key == "particle" then
        local btn = aegisub.dialog.display(
            {
                {class="label", label="Particle Effects"},
                {class="label", label="Select a Particle Effect:"}
            },
            particle_sub_effects
        )
        if btn == "Back" or btn == nil then
            return select_category(subtitles, selected_lines)
        end
        if btn == "Snow Effect" then
            Snow_effect()
            return select_category(subtitles, selected_lines)
        end
        -- 未来可以继续 else 加更多粒子特效
        return select_category(subtitles, selected_lines)
    end



    if category_key == "font" then
        local btn = aegisub.dialog.display(
            {
                {class="label", label="Font & Style"},
                {class="label", label="Choose a function:"}
            },
            {font_style_subcategories[1], font_style_subcategories[2], "Back", "Cancel"}
        )
        if btn == "Back" or btn == nil or btn == "Cancel" then return select_category(subtitles, selected_lines) end
        if btn == font_style_subcategories[1] then
            local btn2 = aegisub.dialog.display(
                {
                    {class="label", label="Font Size & Layout"},
                    {class="label", label="Select a preset:"}
                },
                font_size_list
            )
            if btn2 == nil or btn2 == "Back" then return select_sub_effect(subtitles, selected_lines, category_key) end
            apply_font_style(subtitles, selected_lines, btn2)
            aegisub.dialog.display({{class="label", label="Font effect ["..btn2.."] has been applied."}}, {"OK"})
            return select_category(subtitles, selected_lines)
        elseif btn == font_style_subcategories[2] then
            local btn2 = aegisub.dialog.display(
                {
                    {class="label", label="Position & Alignment"},
                    {class="label", label="Select a position or margin adjustment:"}
                },
                font_alignment_list
            )
            if btn2 == nil or btn2 == "Back" then return select_sub_effect(subtitles, selected_lines, category_key) end
            if btn2 == "Vertical Margin +10px" then
                increase_vertical_margin(subtitles, selected_lines, 10)
                aegisub.dialog.display({{class="label", label="Vertical margin +10px has been applied."}}, {"OK"})
                return select_category(subtitles, selected_lines)
            elseif btn2 == "Horizontal Margin +10px" then
                increase_horizontal_margin(subtitles, selected_lines, 10)
                aegisub.dialog.display({{class="label", label="Horizontal margin +10px has been applied."}}, {"OK"})
                return select_category(subtitles, selected_lines)
            else
                apply_font_alignment(subtitles, selected_lines, btn2)
                aegisub.dialog.display({{class="label", label="Alignment ["..btn2.."] has been applied."}}, {"OK"})
                return select_category(subtitles, selected_lines)
            end
        end
        return select_category(subtitles, selected_lines)
    elseif category_key == "anim" then
        local btn = aegisub.dialog.display(
            {
                {class="label", label="Simple Animation"},
                {class="label", label="Select an animation type:"}
            },
            anim_type_list
        )
        if btn == nil or btn == "Back" then return select_category(subtitles, selected_lines) end

        if btn == "Rotation" then
            local btn2 = aegisub.dialog.display(
                {
                    {class="label", label="Rotation"},
                    {class="label", label="Select a rotation effect:"}
                },
                rotation_list
            )
            if btn2 == nil or btn2 == "Back" then return select_sub_effect(subtitles, selected_lines, category_key) end
            local dlg = {
                {class="label", label="Enter rotation duration (seconds):"},
                {class="intedit", name="seconds", value=10, min=1, max=300}
            }
            local btn_time, result = aegisub.dialog.display(dlg, {"Apply", "Back", "Cancel"})
            if btn_time == "Back" then
                return select_sub_effect(subtitles, selected_lines, category_key)
            elseif btn_time ~= "Apply" then
                return select_category(subtitles, selected_lines)
            else
                apply_custom_rotation(subtitles, selected_lines, btn2, result.seconds)
                aegisub.dialog.display({{class="label", label="Rotation ["..btn2.."] applied."}}, {"OK"})
                return select_category(subtitles, selected_lines)
            end
        elseif btn == "Fade In/Out" then
            local btn2 = aegisub.dialog.display(
                {
                    {class="label", label="Fade In/Out"},
                    {class="label", label="Choose fade type:"}
                },
                fade_list
            )
            if btn2 == nil or btn2 == "Back" then return select_sub_effect(subtitles, selected_lines, category_key) end
            local dialog = {
                {class="label", label="Set Fade Duration (milliseconds):"}
            }
            if btn2 == "Fade In Only" then
                table.insert(dialog, {class="label", label="Fade In duration:"})
                table.insert(dialog, {class="intedit", name="fadein", value=500, min=0, max=10000})
            elseif btn2 == "Fade Out Only" then
                table.insert(dialog, {class="label", label="Fade Out duration:"})
                table.insert(dialog, {class="intedit", name="fadeout", value=500, min=0, max=10000})
            elseif btn2 == "Fade In + Fade Out" then
                table.insert(dialog, {class="label", label="Fade In duration:"})
                table.insert(dialog, {class="intedit", name="fadein", value=500, min=0, max=10000})
                table.insert(dialog, {class="label", label="Fade Out duration:"})
                table.insert(dialog, {class="intedit", name="fadeout", value=500, min=0, max=10000})
            end
            local btn_fade, result = aegisub.dialog.display(dialog, {"Apply", "Back", "Cancel"})
            if btn_fade == "Back" then
                return select_sub_effect(subtitles, selected_lines, category_key)
            elseif btn_fade ~= "Apply" then
                return select_category(subtitles, selected_lines)
            else
                local fin, fout = 0, 0
                if btn2 == "Fade In Only" then fin = result.fadein
                elseif btn2 == "Fade Out Only" then fout = result.fadeout
                elseif btn2 == "Fade In + Fade Out" then fin = result.fadein; fout = result.fadeout end
                apply_fade(subtitles, selected_lines, fin, fout)
                aegisub.dialog.display({{class="label", label="Fade ["..btn2.."] applied."}}, {"OK"})
                return select_category(subtitles, selected_lines)
            end
        end
        return select_category(subtitles, selected_lines)
    end
    -- 其他分类可自定义
end

function main(subtitles, selected_lines)
    aegisub.debug.out("Plugin started! %d lines selected.\n", #selected_lines)
    select_category(subtitles, selected_lines)
end

aegisub.register_macro(script_name, script_description, main)









