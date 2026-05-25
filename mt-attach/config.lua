Config = {}

Config.ToggleKeyDefault = "Y"
Config.ToggleKeyDesc    = "Acoplar/Desacoplar vehículo al remolque"

Config.TrailerDetectRadius = 12.0
Config.MaxHorizontalOffset = 3.2
Config.MaxLongitudinalGap  = 4.5
Config.MinHeightDelta      = -0.05

Config.TrailersAllowed = {
  'TRAILER','TRAILERSMALL','TRAILERLARGE','BOATTRAILER','TRAILERLOGS',
  'TRAILER2','TRAILER3','TR2','TR3',
  'DLTS7','DLTS6','DLTS5','DLTS4','DLTS3','DLTS2','DLTENC4',
  'DLTENC','DLTBOAT','DLTBOAT2','DLTM',
  'DLTENC2','DLTENC3','DLTB2','DLTB4',
  '20FTTRAILER','BCHAYRIDE','BIGTEX20','BIGTEX40','CHAULER','EAGERBEAVER','ENCLOSEDGOOSE','SEMIHAULER','THAULER',
  'CAPTTRAILER','CARTRAILER','WOODCHIPPER','TRAILERCAST','MUGSOPEN','MUGSHAULER','UHAULER',
  'TRAILERS','TRAILERS2','TRAILERS3','TR4',
  'DOCKTRAILER','TVTRAILER',
  'TANKER','TANKER2',
  'ARMYTRAILER','ARMYTRAILER2',
  'FREIGHTTRAILER','PROPTRAILER',
  'GRAINTRAILER','TRFLAT'
}

Config.TrailersAllowedHashes = {
  joaat('trailer'), joaat('trailersmall'), joaat('boattrailer'),
  joaat('trailerlarge'), joaat('trailerlogs'), joaat('trailer2'),
  joaat('trailer3'), joaat('tr2'), joaat('tr3'),
  joaat('dlts7'), joaat('dlts6'), joaat('dlts5'), joaat('dlts4'), joaat('dlts3'), joaat('dlts2'), joaat('dltenc4'),
  joaat('dltenc'), joaat('dltboat'), joaat('dltboat2'), joaat('dltm'),
  joaat('dltenc2'), joaat('dltenc3'), joaat('dltb2'), joaat('dltb4'),
  joaat('20fttrailer'), joaat('bchayride'), joaat('bigtex20'), joaat('bigtex40'),
  joaat('chauler'), joaat('eagerbeaver'), joaat('enclosedgoose'),
  joaat('semihauler'), joaat('thauler'),
  joaat('capttrailer'), joaat('cartrailer'), joaat('woodchipper'),
  joaat('trailercast'), joaat('mugsopen'), joaat('mugshauler'), joaat('uhauler'),
  joaat('trailers'), joaat('trailers2'), joaat('trailers3'), joaat('tr4'),
  joaat('docktrailer'), joaat('tvtrailer'),
  joaat('tanker'), joaat('tanker2'),
  joaat('armytrailer'), joaat('armytrailer2'),
  joaat('freighttrailer'), joaat('proptrailer'),
  joaat('graintrailer'), joaat('trflat')
}

Config.VehicleClassesAllowed = {
  [0]=true,[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,
  [10]=true,[11]=true,[12]=true,[13]=true,[14]=true,[15]=true,[16]=true,[17]=true,[18]=true,[19]=true,[20]=true
}

Config.UseOxTarget = false

Config.DefaultCatalog = {
  { label='Remolque de Barco', model='boattrailer', price=20000, image='fa-solid fa-ship', capacity='5,000 lbs', size="12' x 6'", desc='Ideal para lanchas pequeñas y equipo marinero.' },
  { label='Remolque Pequeño', model='trailersmall', price=20000, image='fa-solid fa-trailer', capacity='7,000 lbs', size="18' x 8'", desc='Porta autos compacto y estable.' },
  { label='DLTS7 (Pequeño)', model='dlts7', price=20000, image='fa-solid fa-trailer', capacity='6,000 lbs', size="14' x 6'", desc='Plataforma ligera, perfecta para tareas diarias.' },
  { label='DLTS6 (Pequeño)', model='dlts6', price=20000, image='fa-solid fa-trailer', capacity='6,500 lbs', size="16' x 6'", desc='Versátil y estable para carga moderada.' },
  { label='DLTS5 (Pequeño)', model='dlts5', price=20000, image='fa-solid fa-trailer', capacity='6,500 lbs', size="16' x 7'", desc='Chasis reforzado y bajo mantenimiento.' },
  { label='DLTS4 (Pequeño)', model='dlts4', price=20000, image='fa-solid fa-trailer', capacity='6,000 lbs', size="14' x 6'", desc='Compacto para espacios reducidos y callejones.' },
  { label='DLTS3 (Pequeño)', model='dlts3', price=20000, image='fa-solid fa-trailer', capacity='5,500 lbs', size="12' x 6'", desc='La opción económica con buen rendimiento.' },
  { label='DLTS2 (Pequeño)', model='dlts2', price=20000, image='fa-solid fa-trailer', capacity='5,500 lbs', size="12' x 6'", desc='Sencillo, práctico y confiable.' },
  { label='DLTENC4 (Pequeño/Cerrado)', model='dltenc4', price=20000, image='fa-solid fa-box', capacity='6,000 lbs', size="14' x 7'", desc='Caja cerrada para proteger carga.' },
  { label='DLTENC (Mediano/Cerrado)', model='dltenc', price=20000, image='fa-solid fa-box', capacity='8,000 lbs', size="16' x 7'", desc='Cerrado multiuso con gran volumen útil.' },
  { label='DLTBOAT (Mediano/Barco)', model='dltboat', price=20000, image='fa-solid fa-ship', capacity='8,000 lbs', size="18' x 7'", desc='Para embarcaciones medianas.' },
  { label='DLTBOAT2 (Mediano/Barco)', model='dltboat2', price=20000, image='fa-solid fa-ship', capacity='8,500 lbs', size="20' x 7'", desc='Mayor longitud para cascos largos.' },
  { label='DLTM (Mediano)', model='dltm', price=20000, image='fa-solid fa-trailer', capacity='9,000 lbs', size="18' x 8'", desc='Eje reforzado para maquinaria compacta.' },
  { label='DLTENC2 (Grande/Cerrado)', model='dltenc2', price=20000, image='fa-solid fa-truck-ramp-box', capacity='10,000 lbs', size="22' x 8'", desc='Carga protegida de gran volumen.' },
  { label='DLTENC3 (Grande/Cerrado)', model='dltenc3', price=20000, image='fa-solid fa-truck-ramp-box', capacity='10,500 lbs', size="24' x 8'", desc='Cerrado amplio para logística intensiva.' },
  { label='DLTB2 (Grande)', model='dltb2', price=20000, image='fa-solid fa-trailer', capacity='12,000 lbs', size="24' x 8.5'", desc='Plataforma larga para vehículos grandes.' },
  { label='DLTB4 (Grande)', model='dltb4', price=50200000, image='fa-solid fa-trailer', capacity='12,000 lbs', size="26' x 8.5'", desc='La opción heavy-duty para transporte pesado.' },
  { label='20ft Trailer (Mediano)', model='20fttrailer', price=20000, image='fa-solid fa-truck-moving', capacity='8,000 lbs', size="20' x 8'", desc='Plataforma de 20 pies para carga general.' },
  { label='Hay Ride (Mediano)', model='bchayride', price=20000, image='fa-solid fa-people-group', capacity='7,500 lbs', size="18' x 8'", desc='Bancas laterales para eventos y paseos.' },
  { label='BigTex 20 (Mediano)', model='bigtex20', price=20000, image='fa-solid fa-trailer', capacity='9,000 lbs', size="20' x 8'", desc='Estructura robusta BigTex (20 pies).' },
  { label='BigTex 40 (Grande)', model='bigtex40', price=20000, image='fa-solid fa-trailer', capacity='14,000 lbs', size="40' x 8.5'", desc='Gooseneck de 40 pies para maquinaria pesada.' },
  { label='Car Hauler (Mediano)', model='chauler', price=20000, image='fa-solid fa-car', capacity='8,000 lbs', size="20' x 8'", desc='Porta autos con rampa y amarres.' },
  { label='Eager Beaver (Grande)', model='eagerbeaver', price=20000, image='fa-solid fa-trailer', capacity='12,500 lbs', size="24' x 8.5'", desc='Especial para equipos de construcción.' },
  { label='Enclosed Goose (Grande/Cerrado)', model='enclosedgoose', price=20000, image='fa-solid fa-box-open', capacity='11,000 lbs', size="26' x 8.5'", desc='Gooseneck cerrado de alta capacidad.' },
  { label='Semi Hauler (Grande)', model='semihauler', price=20000, image='fa-solid fa-truck-moving', capacity='15,000 lbs', size="28' x 8.5'", desc='Plataforma semi con eje reforzado.' },
  { label='Truck Hauler (Mediano)', model='thauler', price=20000, image='fa-solid fa-truck', capacity='9,500 lbs', size="22' x 8'", desc='Pensado para transportar pickups y SUVs.' }
}

Config.Shops = {
  {
    pedModel = 's_m_m_autoshop_02',
    coords   = vec4(6540.3896, -2347.0227, 13.8252, 137.3424),
    blip     = { sprite=479, color=45, scale=0.75, name='Alquiler de Remolques' },
    spawns   = {
      vec4(6523.1553, -2361.8872, 13.7535, 262.1622),
    },
    PreviewPos = vec4(6523.1553, -2361.8872, 13.7535, 262.1622),
    CamPos = vec3(6530.0132, -2367.8853, 14.6866),
    CamRot = vec3(-15.0, 0.0, 65.0),
    catalogo = "default"
  },
}

Config.Refund = 200

Config.Txt = {
  PressToToggle     = "Pulsa ~INPUT_CONTEXT_SECONDARY~ (%s) para acoplar/desacoplar",
  MustBeOnTrailer   = "Debes estar encima de un remolque permitido.",
  NotAllowed        = "Este vehículo no está permitido para acoplarse.",
  Attached          = "Vehículo acoplado al remolque.",
  Detached          = "Vehículo desacoplado.",
  NoTrailerFound    = "No se encontró un remolque válido cerca.",
  RentOpen          = "Abrir catálogo de remolques",
  Bought            = "Has alquilado: %s por $%d",
  NotEnough         = "No tienes fondos suficientes.",
  NotEnoughCash     = "No tienes efectivo suficiente.",
  NotEnoughBank     = "No tienes ~saldo en banco.",
  InvalidMethod     = "Método de pago inválido.",
  ModelNotFound     = "Modelo no disponible.",
  ReturnTrailer     = "Devolver Remolque",
  NoTrailerToReturn = "No hay ningún remolque cerca para devolver."
}

Config.Notify = function(target, msg, type)
  if IsDuplicityVersion() then
    -- Server side: target is ID, msg is string, type is string
    -- In modern ESX, exports['es_extended']:getSharedObject().ShowNotification(target, msg) is also common
    TriggerClientEvent('esx:showNotification', target, msg)
    return
  end

  -- Client side: target is msg, msg is type
  local actualMsg = target
  local actualType = msg or 'info'
  if actualType == 'primary' then actualType = 'info' end
  
  local ox = GetResourceState('ox_lib') == 'started'
  if ox and lib and lib.notify then
    lib.notify({
      title = 'Remolques',
      description = actualMsg,
      type = actualType,
      position = 'top'
    })
  else
    if ESX and ESX.ShowNotification then
        ESX.ShowNotification(actualMsg)
    else
        print(string.format("[Trailer] %s: %s", actualType, actualMsg))
    end
  end
end

Config.TargetDetach = true
Config.TargetDistance   = 3.2
Config.DetachScanRadius = 12.0
Config.DetachAnimDict = 'mini@repair'
Config.DetachAnimName = 'fixing_a_ped'
Config.DetachWalkSpeed = 2.0
Config.DetachStopDist  = 1.25
Config.HitchBones = { 'towbar','attach_female','attach_male','bumper_r','boot','misc_a','chassis','bodyshell' }
Config.DetachHoldUntilSeparated = { minDistance = 1.6, minTimeMs = 800, maxHoldMs = 6000, minSpeed = 0.6 }
