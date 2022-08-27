AddCSLuaFile()

SWEP.PrintName = "Electroshock Tool"
SWEP.Author = "CRD716"
SWEP.Instructions = "Left click to perform electroshock."

SWEP.Spawnable = true
SWEP.AdminOnly = true 

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot			= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true

SWEP.ViewModel			= "models/weapons/v_pistol.mdl"
SWEP.WorldModel			= "models/weapons/w_pistol.mdl"

SWEP.ShootSound = Sound( "Metal.SawbladeStick" )

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire( CurTime() + 0.5 )	

	self:Electroshock()
end

function SWEP:SecondaryAttack()

end

function SWEP:Electroshock()
	local owner = self:GetOwner()

	if ( not owner:IsValid() ) then return end
	
	local target = owner:GetEyeTrace().Entity	
	if (target:IsPlayer()) then
		self:EmitSound( self.ShootSound )

		if (SERVER) then
    	
			// DEBUG
    		// print(type(target))
   			// print(target)

			// Find the target's position, kill them silently, spawn them, and teleport them.
    		local targetPos = target:GetPos()
    		target:KillSilent()
    		target:Spawn()
    		target:SetPos(targetPos)
		end
	end
end 