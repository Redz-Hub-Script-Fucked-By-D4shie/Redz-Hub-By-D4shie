local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove se já existir para evitar duplicatas
if playerGui:FindFirstChild("RedzHubGui") then
    playerGui.RedzHubGui:Destroy()
end

-- Cria a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RedzHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Fundo Preto
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0 -- Começa totalmente opaco
background.Parent = screenGui

-- Texto "Redz Hub"
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 400, 0, 100)
textLabel.Position = UDim2.new(0.5, -200, 0.5, -50)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Redz Hub"
textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Letra vermelha
textLabel.TextTransparency = 0 -- Começa visível
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.Parent = screenGui

-- Tempo de espera inicial (fica visível por 1 segundo antes de começar a sumir)
task.wait(1)

-- Configuração da animação (3 segundos)
local tempoAnimacao = 3
local infoTween = TweenInfo.new(tempoAnimacao, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Cria os tweens para sumir o fundo e o texto juntos
local tweenFundo = TweenService:Create(background, infoTween, {BackgroundTransparency = 1})
local tweenTexto = TweenService:Create(textLabel, infoTween, {TextTransparency = 1})

-- Inicia as animações
tweenFundo:Play()
tweenTexto:Play()

-- Quando a animação terminar, deleta o ScreenGui da tela
tweenFundo.Completed:Connect(function()
    screenGui:Destroy()
end)
task.wait(5)
-- Redz Hub Completo: Shotgun Inteligente (Case-Insensitive) + Fruta Meme + Sanguine Art + Godhuman + Divine Art + Sidebar + Race + Farm
local Library = {}

function Library:CreateWindow(title)
    if game.CoreGui:FindFirstChild("RedzHub") then
        game.CoreGui.RedzHub:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local isMobile = UserInputService.TouchEnabled
    
    local ToggleButton = Instance.new("ImageButton")
    local ToggleBorder = Instance.new("UIStroke")
    local ToggleCorner = Instance.new("UICorner")
    
    ScreenGui.Name = "RedzHub"
    ScreenGui.Parent = game.CoreGui
    
    ToggleButton.Name = "ToggleFloatBtn"
    ToggleButton.Parent = ScreenGui
    ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ToggleButton.Position = isMobile and UDim2.new(0, 20, 0, 150) or UDim2.new(0, 50, 0, 200)
    ToggleButton.Size = isMobile and UDim2.new(0, 50, 0, 50) or UDim2.new(0, 45, 0, 45)
    ToggleButton.Image = "rbxassetid://119033154831642"
    ToggleButton.Active = true
    ToggleButton.Draggable = true
    
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleButton
    
    ToggleBorder.Parent = ToggleButton
    ToggleBorder.Color = Color3.fromRGB(255, 0, 0)
    ToggleBorder.Thickness = 2
    
    local Main = Instance.new("Frame")
    local MainBorder = Instance.new("UIStroke")
    local MainCorner = Instance.new("UICorner")
    local Sidebar = Instance.new("ScrollingFrame")
    local Container = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local LogoImage = Instance.new("ImageLabel")
    
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    
    if isMobile then
        Main.Position = UDim2.new(0.5, -230, 0.5, -165)
        Main.Size = UDim2.new(0, 460, 0, 330)
    else
        Main.Position = UDim2.new(0.5, -275, 0.5, -185)
        Main.Size = UDim2.new(0, 550, 0, 370)
    end
    
    Main.Active = true
    Main.Visible = true
    
    ToggleButton.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)
    
    MainBorder.Parent = Main
    MainBorder.Color = Color3.fromRGB(255, 0, 0)
    MainBorder.Thickness = 2
    
    MainCorner.CornerRadius = UDim.new(0, 6)
    MainCorner.Parent = Main
    
    local dragging, dragInput, dragStart, startPos
    
    TitleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TitleLabel.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    LogoImage.Name = "LogoBackground"
    LogoImage.Parent = TitleLabel
    LogoImage.BackgroundTransparency = 1
    LogoImage.Position = UDim2.new(0, 5, 0, 2)
    LogoImage.Size = UDim2.new(0, 31, 0, 31)
    LogoImage.Image = "rbxassetid://119033154831642"
    LogoImage.ImageTransparency = 0.2
    
    TitleLabel.Parent = Main
    TitleLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TitleLabel.Size = UDim2.new(1, 0, 0, 35)
    TitleLabel.Font = Enum.Font.FredokaOne
    TitleLabel.Text = "        " .. (title or "Redz Hub")
    TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local sidebarWidth = isMobile and 130 or 150
    
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Sidebar.Position = UDim2.new(0, 0, 0, 35)
    Sidebar.Size = UDim2.new(0, sidebarWidth, 1, -35)
    Sidebar.ScrollBarThickness = 3
    Sidebar.ScrollingDirection = Enum.ScrollingDirection.Y
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    Container.Name = "Container"
    Container.Parent = Main
    Container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Container.Position = UDim2.new(0, sidebarWidth, 0, 35)
    Container.Size = UDim2.new(1, -sidebarWidth, 1, -35)
    
    local TabsList = Instance.new("UIListLayout")
    TabsList.Parent = Sidebar
    TabsList.SortOrder = Enum.SortOrder.LayoutOrder
    
    TabsList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Sidebar.CanvasSize = UDim2.new(0, 0, 0, TabsList.AbsoluteContentSize.Y + 10)
    end)
    
    -- Função interna para aplicar a animação de clique em qualquer botão
    local function applyClickAnimation(btn, defaultColor)
        btn.MouseButton1Click:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Fica todo vermelho ao clicar
            
            local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(btn, tweenInfo, {BackgroundColor3 = defaultColor})
            tween:Play()
        end)
    end
    
    local UISelector = {}
    local first = true
    
    function UISelector:CreateTab(tabName)
        local TabButton = Instance.new("TextButton")
        local TabButtonBorder = Instance.new("UIStroke")
        local TabContent = Instance.new("ScrollingFrame")
        
        TabButton.Parent = Sidebar
        TabButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.Font = Enum.Font.FredokaOne
        TabButton.Text = "  " .. tabName
        TabButton.TextColor3 = Color3.fromRGB(180, 0, 0)
        TabButton.TextSize = 13
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        
        TabButtonBorder.Parent = TabButton
        TabButtonBorder.Color = Color3.fromRGB(50, 0, 0)
        TabButtonBorder.Thickness = 1
        
        applyClickAnimation(TabButton, Color3.fromRGB(15, 15, 15))
        
        TabContent.Name = tabName .. "Content"
        TabContent.Parent = Container
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = first
        TabContent.ScrollBarThickness = 5
        TabContent.ScrollingDirection = Enum.ScrollingDirection.Y
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = TabContent
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 5)
        
        ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 15)
        end)
        
        if first then
            TabButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            TabButtonBorder.Color = Color3.fromRGB(255, 0, 0)
            first = false
        end
        
        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end
            for _, v in pairs(Sidebar:GetChildren()) do
                if v:IsA("TextButton") then
                    v.TextColor3 = Color3.fromRGB(180, 0, 0)
                    if v:FindFirstChildOfClass("UIStroke") then
                        v:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(50, 0, 0)
                    end
                end
            end
            TabContent.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            TabButtonBorder.Color = Color3.fromRGB(255, 0, 0)
        end)
        
        local TabFunctions = {}
        
        function TabFunctions:AddButton(text, callback)
            local Btn = Instance.new("TextButton")
            local BtnBorder = Instance.new("UIStroke")
            local BtnCorner = Instance.new("UICorner")
            
            Btn.Parent = TabContent
            Btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            Btn.Size = UDim2.new(1, -15, 0, 35)
            Btn.Font = Enum.Font.FredokaOne
            Btn.Text = "  " .. text
            Btn.TextColor3 = Color3.fromRGB(255, 0, 0)
            Btn.TextSize = 13
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            
            BtnBorder.Parent = Btn
            BtnBorder.Color = Color3.fromRGB(150, 0, 0)
            BtnBorder.Thickness = 1
            
            BtnCorner.CornerRadius = UDim.new(0, 4)
            BtnCorner.Parent = Btn
            
            applyClickAnimation(Btn, Color3.fromRGB(15, 15, 15))
            
            Btn.MouseButton1Click:Connect(function()
                _G.RedzButtonsUsed = (_G.RedzButtonsUsed or 0) + 1
                pcall(callback)
            end)
        end
        
        function TabFunctions:AddLabel(text)
            local Lbl = Instance.new("TextLabel")
            local LblBorder = Instance.new("UIStroke")
            local LblCorner = Instance.new("UICorner")
            
            Lbl.Parent = TabContent
            Lbl.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
            Lbl.Size = UDim2.new(1, -15, 0, 32)
            Lbl.Font = Enum.Font.FredokaOne
            Lbl.Text = "  " .. text
            Lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
            Lbl.TextSize = 12
            Lbl.TextXAlignment = Enum.TextXAlignment.Left
            
            LblBorder.Parent = Lbl
            LblBorder.Color = Color3.fromRGB(80, 0, 0)
            LblBorder.Thickness = 1
            
            LblCorner.CornerRadius = UDim.new(0, 4)
            LblCorner.Parent = Lbl
            
            return Lbl
        end
        
        function TabFunctions:AddToggle(text, default, callback)
            local toggled = default
            local Btn = Instance.new("TextButton")
            local BtnBorder = Instance.new("UIStroke")
            local BtnCorner = Instance.new("UICorner")
            
            Btn.Parent = TabContent
            Btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            Btn.Size = UDim2.new(1, -15, 0, 35)
            Btn.Font = Enum.Font.FredokaOne
            Btn.Text = "  " .. text .. ": " .. (toggled and "ON" or "OFF")
            Btn.TextColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            Btn.TextSize = 13
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            
            BtnBorder.Parent = Btn
            BtnBorder.Color = toggled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
            BtnBorder.Thickness = 1
            
            BtnCorner.CornerRadius = UDim.new(0, 4)
            BtnCorner.Parent = Btn
            
            applyClickAnimation(Btn, Color3.fromRGB(15, 15, 15))
            
            Btn.MouseButton1Click:Connect(function()
                toggled = not toggled
                Btn.Text = "  " .. text .. ": " .. (toggled and "ON" or "OFF")
                Btn.TextColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                BtnBorder.Color = toggled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
                _G.RedzButtonsUsed = (_G.RedzButtonsUsed or 0) + 1
                pcall(function() callback(toggled) end)
            end)
        end
        
        function TabFunctions:AddSlider(text, min, max, default, callback, isDecimal)
            local SliderFrame = Instance.new("Frame")
            local SliderBorder = Instance.new("UIStroke")
            local SliderCorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderBar = Instance.new("Frame")
            local SliderBarCorner = Instance.new("UICorner")
            local SliderFill = Instance.new("Frame")
            local SliderFillCorner = Instance.new("UICorner")
            local SliderButton = Instance.new("TextButton")
            
            SliderFrame.Parent = TabContent
            SliderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            SliderFrame.Size = UDim2.new(1, -15, 0, 50)
            
            SliderBorder.Parent = SliderFrame
            SliderBorder.Color = Color3.fromRGB(150, 0, 0)
            SliderBorder.Thickness = 1
            
            SliderCorner.CornerRadius = UDim.new(0, 4)
            SliderCorner.Parent = SliderFrame
            
            SliderTitle.Parent = SliderFrame
            SliderTitle.BackgroundTransparency = 1
            SliderTitle.Position = UDim2.new(0, 5, 0, 5)
            SliderTitle.Size = UDim2.new(1, -10, 0, 20)
            SliderTitle.Font = Enum.Font.FredokaOne
            SliderTitle.Text = "  " .. text .. ": " .. tostring(default) .. (isDecimal and "s" or "")
            SliderTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
            SliderTitle.TextSize = 12
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            SliderBar.Parent = SliderFrame
            SliderBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderBar.Position = UDim2.new(0, 10, 0, 32)
            SliderBar.Size = UDim2.new(1, -20, 0, 10)
            
            SliderBarCorner.CornerRadius = UDim.new(1, 0)
            SliderBarCorner.Parent = SliderBar
            
            SliderFill.Parent = SliderBar
            SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            
            SliderFillCorner.CornerRadius = UDim.new(1, 0)
            SliderFillCorner.Parent = SliderFill
            
            SliderButton.Parent = SliderBar
            SliderButton.BackgroundTransparency = 1
            SliderButton.Size = UDim2.new(1, 0, 1, 0)
            SliderButton.Text = ""
            
            local uis = game:GetService("UserInputService")
            local value = default
            
            local function updateValue(input)
                local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                if isDecimal then
                    value = tonumber(string.format("%.1f", min + ((max - min) * pos)))
                else
                    value = math.floor(min + ((max - min) * pos))
                end
                SliderFill.Size = UDim2.new(pos, 0, 1, 0)
                SliderTitle.Text = "  " .. text .. ": " .. tostring(value) .. (isDecimal and "s" or "")
                pcall(function() callback(value) end)
            end
            
            local draggingSlider = false
            SliderButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = true
                    updateValue(input)
                end
            end)
            
            uis.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = false
                end
            end)
            
            uis.InputChanged:Connect(function(input)
                if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateValue(input)
                end
            end)
        end
        
        return TabFunctions
    end
    
    return UISelector
end

-- Criando a Interface do Redz Hub
local Window = Library:CreateWindow("Redz Hub")
_G.RedzButtonsUsed = 0

-- Listas
local frutas = {"Meme", "Rumble", "Dark", "Spider", "Quake", "Ice", "Kilo", "Spin", "Rocket", "Spring", "Pain", "Portal"}
local fightingStyles = {"Divine Art", "Sanguine Art", "Godhuman", "Electric Claw", "Death Step", "Superhuman"}

local function getNearestPlayer()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    
    local target = nil
    local shortestDistance = math.huge
    
    for _, otherPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                target = otherPlayer.Character
            end
        end
    end
    
    return target
end

-- Aba: Home
local HomeTab = Window:CreateTab("🏠 Home")

HomeTab:AddLabel("--- Informações do Servidor ---")
local ServerTimeLbl = HomeTab:AddLabel("Tempo do Servidor: Carregando...")
local PlayerTimeLbl = HomeTab:AddLabel("Seu Tempo no Servidor: Carregando...")
local PlayersCountLbl = HomeTab:AddLabel("Jogadores Online: Carregando...")
local ButtonsUsedLbl = HomeTab:AddLabel("Botões Utilizados: 0")

HomeTab:AddLabel("--- Comunidade Discord ---")
HomeTab:AddLabel("Discord: Redz Hub Official")
HomeTab:AddLabel("Convite: discord.gg/YNDPCd8Rpb")
HomeTab:AddLabel("Descrição: O melhor hub de scripts do Roblox!")

HomeTab:AddButton("Copiar Link do Discord", function()
    if setclipboard then
        setclipboard("https://discord.gg/YNDPCd8Rpb")
    end
end)

task.spawn(function()
    local startTime = tick()
    local playerJoinTime = tick()
    local Players = game:GetService("Players")
    
    while task.wait(1) do
        local serverUptime = math.floor(tick() - startTime)
        local sM = math.floor(serverUptime / 60)
        local sS = serverUptime % 60
        
        local playerUptime = math.floor(tick() - playerJoinTime)
        local pM = math.floor(playerUptime / 60)
        local pS = playerUptime % 60
        
        ServerTimeLbl.Text = string.format("  Tempo do Servidor: %dm %ds", sM, sS)
        PlayerTimeLbl.Text = string.format("  Seu Tempo no Servidor: %dm %ds", pM, pS)
        PlayersCountLbl.Text = "  Jogadores Online: " .. tostring(#Players:GetPlayers()) .. " / " .. tostring(Players.MaxPlayers)
        ButtonsUsedLbl.Text = "  Botões Utilizados: " .. tostring(_G.RedzButtonsUsed or 0)
    end
end)

-- Aba: Farm (Fly Tween Dinâmico Contínuo + Forest Pirates + Acidum Rifle + Collect Money)
local FarmTab = Window:CreateTab("🌾 Farm")

local autoFarmActive = false
local farmFlySpeed = 250
local shootCooldown = 0.5

FarmTab:AddSlider("Velocidade do Fly Tween", 50, 500, 250, function(value)
    farmFlySpeed = value
end)

FarmTab:AddSlider("Velocidade de Tiro", 0.1, 1.0, 0.5, function(value)
    shootCooldown = value
end, true)

-- Toggle Collect Money
local collectMoneyActive = false
FarmTab:AddToggle("Collect Money", false, function(state)
    collectMoneyActive = state
    if collectMoneyActive then
        task.spawn(function()
            while collectMoneyActive do
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        local descendants = workspace:GetDescendants()
                        for i = 1, #descendants do
                            local obj = descendants[i]
                            if obj:IsA("BasePart") then
                                local touch = obj:FindFirstChildOfClass("TouchTransmitter")
                                if touch then
                                    firetouchinterest(root, obj, 0)
                                    firetouchinterest(root, obj, 1)
                                end
                            end
                        end
                    end
                end)
                task.wait(5)
            end
        end)
    end
end)

-- Botão para coletar / ativar todos os títulos via RemoteFunction com true
FarmTab:AddButton("Collect All Titles (True)", function()
    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("TitleRemotes"):WaitForChild("GetTitles"):InvokeServer(true)
    end)
end)

FarmTab:AddToggle("Auto Farm Forest Pirates", false, function(state)
    autoFarmActive = state
    local player = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    
    task.spawn(function()
        while autoFarmActive do
            task.wait(0.2)
            pcall(function()
                local character = player.Character
                if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                local hrp = character.HumanoidRootPart
                
                -- Garantir que a arma Acidum Rifle esteja equipada logo de início
                local tool = character:FindFirstChild("Acidum Rifle") or player.Backpack:FindFirstChild("Acidum Rifle")
                if tool then
                    tool.Parent = character
                end
                
                -- Procurar o NPC "Forest Pirate" mais próximo que esteja vivo
                local targetModel = nil
                local targetRoot = nil
                local shortestDist = math.huge
                
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj.Name == "Forest Pirate" or obj.Name == "Forest Pirates" then
                        if obj:IsA("Model") then
                            local humanoid = obj:FindFirstChildOfClass("Humanoid")
                            local rootPart = obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
                            
                            if humanoid and humanoid.Health > 0 and rootPart then
                                local dist = (hrp.Position - rootPart.Position).Magnitude
                                if dist < shortestDist then
                                    shortestDist = dist
                                    targetModel = obj
                                    targetRoot = rootPart
                                end
                            end
                        end
                    end
                end
                
                if targetRoot and autoFarmActive then
                    -- Desativar colisão do player durante o farm
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    
                    local hum = targetModel and targetModel:FindFirstChildOfClass("Humanoid")
                    
                    -- Conexão fluída quadro a quadro para o Fly Tween 10+ Y e disparos automáticos sincronizados
                    local connection
                    local lastShot = 0
                    
                    connection = RunService.RenderStepped:Connect(function(dt)
                        if not autoFarmActive or not hum or hum.Health <= 0 or not targetRoot.Parent then
                            connection:Disconnect()
                            return
                        end
                        
                        local curChar = player.Character
                        if not curChar or not curChar:FindFirstChild("HumanoidRootPart") then return end
                        local myHRP = curChar.HumanoidRootPart
                        
                        -- Posição exata mantendo 10 studs de altura acima do NPC
                        local goalCFrame = targetRoot.CFrame + Vector3.new(0, 10, 0)
                        
                        -- Movimento suave e contínuo (Fly Tween por Lerp ajustado pela velocidade)
                        local speedFactor = math.clamp(dt * (farmFlySpeed / 30), 0.05, 1)
                        myHRP.CFrame = myHRP.CFrame:Lerp(goalCFrame, speedFactor)
                        myHRP.Velocity = Vector3.new(0, 0, 0)
                        
                        -- Sistema de disparo contínuo integrado no mesmo ciclo do Tween (funciona desde o primeiro NPC)
                        if tick() - lastShot >= shootCooldown then
                            lastShot = tick()
                            
                            local acidumRifle = curChar:FindFirstChild("Acidum Rifle") or player.Backpack:FindFirstChild("Acidum Rifle")
                            if acidumRifle then
                                if acidumRifle.Parent == player.Backpack then
                                    acidumRifle.Parent = curChar
                                end
                                
                                local directionVector = (targetRoot.Position - myHRP.Position).Unit
                                local args = {
                                    [1] = targetRoot.Position,
                                    [2] = directionVector
                                }
                                
                                if acidumRifle:FindFirstChild("M1") and acidumRifle.M1:IsA("RemoteEvent") then
                                    acidumRifle.M1:FireServer(unpack(args))
                                end
                            end
                        end
                    end)
                    
                    -- Aguarda o NPC morrer para buscar o próximo
                    while autoFarmActive and hum and hum.Health > 0 and targetRoot.Parent do
                        task.wait(0.1)
                    end
                    
                    if connection then
                        connection:Disconnect()
                    end
                    
                    -- Reativar colisões ao terminar o alvo atual
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end)
        end
    end)
end)

-- Aba: Race
local RaceTab = Window:CreateTab("🧬 Race")

RaceTab:AddButton("Race Reroll", function()
    local args = {
        [1] = "Reroll"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CustomRaceReroll"):InvokeServer(unpack(args))
end)

local loopActivateAbilityActive = false
RaceTab:AddToggle("Loop ActivateAbility", false, function(state)
    loopActivateAbilityActive = state
    if loopActivateAbilityActive then
        task.spawn(function()
            while loopActivateAbilityActive do
                pcall(function()
                    local args = {
                        [1] = "ActivateAbility"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE"):FireServer(unpack(args))
                end)
                task.wait(0)
            end
        end)
    end
end)

-- Aba: Itens
local ItensTab = Window:CreateTab("❒ Itens")

local equipAllActivated = false
ItensTab:AddButton("Equip ALL Tools", function()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local backpack = player.Backpack
    
    if not character then return end
    
    if equipAllActivated then
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = backpack
            end
        end
        equipAllActivated = false
    else
        for _, v in pairs(backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = character
            end
        end
        equipAllActivated = true
    end
end)

ItensTab:AddButton("Shotgun", function()
    pcall(function()
        local args = {
            [1] = "LoadItem",
            [2] = "Shotgun"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end)
    
    -- Procura e equipa qualquer variação case-insensitive (Shotgun, shotgun, ShotGun, shotGun) no inventário
    task.spawn(function()
        task.wait(0.3)
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        if not character then return end
        
        for i = 1, 10 do
            local found = false
            for _, tool in ipairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    local lowerName = string.lower(tool.Name)
                    if lowerName == "shotgun" or lowerName:find("shotgun") then
                        tool.Parent = character
                        found = true
                        break
                    end
                end
            end
            if found then break end
            task.wait(0.2)
        end
    end)
end)

-- Aba: Equips
local EquipsTab = Window:CreateTab("⚔︎ Equips")

EquipsTab:AddButton("Get TTY", function()
    local args = {
        [1] = "LoadItem",
        [2] = "Triple Dark Blade"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end)

EquipsTab:AddButton("Dark Dagger", function()
    local args = {
        [1] = "LoadItem",
        [2] = "Dark Dagger"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end)

-- Aba: Fruits
local FruitsTab = Window:CreateTab(" Fruits")

for _, fruta in ipairs(frutas) do
    local nomeDuplicado = fruta .. "-" .. fruta
    FruitsTab:AddButton(nomeDuplicado, function()
        local args = {
            [1] = nomeDuplicado
        }
        game:GetService("ReplicatedStorage"):WaitForChild("ChangeFruit"):FireServer(unpack(args))
    end)
end

-- Aba: Fighting Style
local FightTab = Window:CreateTab("阿 Fighting Style")

for _, style in ipairs(fightingStyles) do
    FightTab:AddButton(style, function()
        local args = {
            [1] = "LoadItem",
            [2] = style
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end)
end

-- Aba: PvP
local PvPTab = Window:CreateTab("⚡︎ PvP")

PvPTab:AddButton("Lock On", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
end)

PvPTab:AddButton("Grudar no Inimigo (Até Morrer)", function()
    task.spawn(function()
        local player = game:GetService("Players").LocalPlayer
        local RunService = game:GetService("RunService")
        
        local targetChar = getNearestPlayer()
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") or not targetChar:FindFirstChild("Humanoid") then
            return
        end
        
        local targetHRP = targetChar.HumanoidRootPart
        local targetHumanoid = targetChar.Humanoid
        
        local grudeConnection
        grudeConnection = RunService.RenderStepped:Connect(function()
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            if targetHumanoid.Health <= 0 or not targetHRP.Parent then
                grudeConnection:Disconnect()
                return
            end
            
            character.HumanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 1.5)
        end)
    end)
end)

-- Variáveis de Configuração
local loopBringActive = false
local loopBringDist = 3
local loopBringConn = nil

local hitboxActive = false
local hitboxSize = 50
local hitboxConn = nil

-- Sliders e Toggles de PvP
PvPTab:AddSlider("Loop Bring Distância", 1, 200, 3, function(value)
    loopBringDist = value
end)

PvPTab:AddToggle("Loop Bring All", false, function(state)
    loopBringActive = state
    local player = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    
    if loopBringActive then
        loopBringConn = RunService.Heartbeat:Connect(function()
            pcall(function()
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local myRoot = character.HumanoidRootPart
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local otherRoot = p.Character.HumanoidRootPart
                            local hum = p.Character:FindFirstChildOfClass("Humanoid")
                            if hum and hum.Health > 0 then
                                otherRoot.CFrame = myRoot.CFrame + (myRoot.CFrame.LookVector * loopBringDist)
                            end
                        end
                    end
                end
            end)
        end)
    else
        if loopBringConn then
            loopBringConn:Disconnect()
            loopBringConn = nil
        end
    end
end)

PvPTab:AddSlider("Hitbox Tamanho", 1, 10000, 50, function(value)
    hitboxSize = value
end)

PvPTab:AddToggle("Hitbox Extender", false, function(state)
    hitboxActive = state
    local player = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    
    if hitboxActive then
        hitboxConn = RunService.RenderStepped:Connect(function()
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = p.Character.HumanoidRootPart
                        hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                        hrp.Transparency = 0.7
                        hrp.BrickColor = BrickColor.new("Really blue")
                        hrp.Material = Enum.Material.Neon
                        hrp.CanCollide = false
                    end
                end
            end)
        end)
    else
        if hitboxConn then
            hitboxConn:Disconnect()
        end
        pcall(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = p.Character.HumanoidRootPart
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                end
            end
        end)
    end
end)

-- Aba: Fake Admin
local FakeAdminTab = Window:CreateTab("🤖 Fake Admin")

FakeAdminTab:AddButton("Dar Fruta Portal", function()
    local TextChatService = game:GetService("TextChatService")

    local function enviarPeloChatNovo()
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels and textChannels:FindFirstChild("RBXGeneral") then
            textChannels.RBXGeneral:SendAsync("/give me Portal-Portal")
            return true
        end
        return false
    end

    local function enviarPeloChatAntigo()
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultChatSystemChatEvents then
            local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer("/give me Portal-Portal", "All")
                return true
            end
        end
        return false
    end

    local args = {
        [1] = "Portal-Portal"
    }

    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("ChangeFruit"):FireServer(unpack(args))
    end)

    if not enviarPeloChatNovo() then
        enviarPeloChatAntigo()
    end
end)

FakeAdminTab:AddButton("Dar Triple Dark Blade", function()
    local TextChatService = game:GetService("TextChatService")

    local function enviarPeloChatNovo()
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels and textChannels:FindFirstChild("RBXGeneral") then
            textChannels.RBXGeneral:SendAsync("/give me Triple Dark Blade")
            return true
        end
        return false
    end

    local function enviarPeloChatAntigo()
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultChatSystemChatEvents then
            local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer("/give me Triple Dark Blade", "All")
                return true
            end
        end
        return false
    end

    pcall(function()
        local args = {
            [1] = "LoadItem",
            [2] = "Triple Dark Blade"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end)

    if not enviarPeloChatNovo() then
        enviarPeloChatAntigo()
    end
end)

FakeAdminTab:AddButton("Dar Divine Art", function()
    local TextChatService = game:GetService("TextChatService")

    local function enviarPeloChatNovo()
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels and textChannels:FindFirstChild("RBXGeneral") then
            textChannels.RBXGeneral:SendAsync("/give me Divine Art")
            return true
        end
        return false
    end

    local function enviarPeloChatAntigo()
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultChatSystemChatEvents then
            local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer("/give me Divine Art", "All")
                return true
            end
        end
        return false
    end

    pcall(function()
        local args = {
            [1] = "LoadItem",
            [2] = "Divine Art"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end)

    if not enviarPeloChatNovo() then
        enviarPeloChatAntigo()
    end
end)

FakeAdminTab:AddButton("Dar Sanguine Art", function()
    local TextChatService = game:GetService("TextChatService")

    local function enviarPeloChatNovo()
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels and textChannels:FindFirstChild("RBXGeneral") then
            textChannels.RBXGeneral:SendAsync("/give me Sanguine Art")
            return true
        end
        return false
    end

    local function enviarPeloChatAntigo()
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultChatSystemChatEvents then
            local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer("/give me Sanguine Art", "All")
                return true
            end
        end
        return false
    end

    pcall(function()
        local args = {
            [1] = "LoadItem",
            [2] = "Sanguine Art"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end)

    if not enviarPeloChatNovo() then
        enviarPeloChatAntigo()
    end
end)
