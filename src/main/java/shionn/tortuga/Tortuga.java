package shionn.tortuga;

import com.jme3.app.SimpleApplication;
import com.jme3.environment.FastLightProbeFactory;
import com.jme3.light.DirectionalLight;
import com.jme3.light.LightProbe;
import com.jme3.material.Material;
import com.jme3.math.ColorRGBA;
import com.jme3.math.Vector3f;
import com.jme3.post.FilterPostProcessor;
import com.jme3.renderer.RenderManager;
import com.jme3.renderer.queue.RenderQueue.ShadowMode;
import com.jme3.scene.Node;
import com.jme3.scene.Spatial;
import com.jme3.shadow.DirectionalLightShadowFilter;
import com.jme3.terrain.geomipmap.TerrainLodControl;
import com.jme3.terrain.geomipmap.TerrainQuad;
import com.jme3.terrain.geomipmap.lodcalc.DistanceLodCalculator;
import com.jme3.terrain.heightmap.AbstractHeightMap;
import com.jme3.terrain.heightmap.ImageBasedHeightMap;
import com.jme3.texture.Texture;
import com.jme3.texture.Texture.WrapMode;
import com.jme3.texture.Texture2D;
import com.jme3.util.SkyFactory;
import com.jme3.util.SkyFactory.EnvMapType;
import com.jme3.water.WaterFilter;

/**
 * This is the Main Class of your Game. It should boot up your game and do
 * initial initialisation Move your Logic into AppStates or Controls or other
 * java classes
 */
public class Tortuga extends SimpleApplication {
	/*
	 * XDG_SESSION_TYPE=x11
	 */
	public static void main(String[] args) {
		Tortuga app = new Tortuga();
		app.setShowSettings(true); // Settings dialog not supported on mac
//		app.setDis
		app.start();
	}

	final private float grassScale = 64;
	final private float dirtScale = 16;
	final private float rockScale = 128;

	@Override
	public void simpleInitApp() {
		flyCam.setMoveSpeed(250);

		Node sceneNode = new Node();
		sceneNode.setShadowMode(ShadowMode.CastAndReceive);
		sceneNode.attachChild(assetManager.loadModel("Models/ship-pirate-large.glb"));
		sceneNode.attachChild(loadMap());
		DirectionalLight sun = new DirectionalLight(new Vector3f(-1, -1, -1).normalize(), ColorRGBA.White);
		rootNode.addLight(sun);
//		sceneNode.addLight(buildProbe(sceneNode));

		rootNode.attachChild(sceneNode);
		rootNode.attachChild(createSky());

		//
//		waterProcessor = new SimpleWaterProcessor(assetManager);

		FilterPostProcessor fpp = new FilterPostProcessor(assetManager);
		fpp.addFilter(buildShadow(sun));
		fpp.addFilter(buildWater(sun));

		viewPort.addProcessor(fpp);
	}


	private Spatial createSky() {
		Spatial sky = SkyFactory.createSky(assetManager, "Scenes/Beach/FullskiesSunset0068.dds", EnvMapType.CubeMap);
		sky.setShadowMode(ShadowMode.Off);
		return sky;
	}

	private WaterFilter buildWater(DirectionalLight sun) {
		final WaterFilter water = new WaterFilter(rootNode, sun.getDirection());
        water.setWaterColor(new ColorRGBA().setAsSrgb(0.0078f, 0.3176f, 0.5f, 1.0f));
        water.setDeepWaterColor(new ColorRGBA().setAsSrgb(0.0039f, 0.00196f, 0.145f, 1.0f));
        water.setUnderWaterFogDistance(80);
        water.setWaterTransparency(0.12f);
        water.setFoamIntensity(0.4f);
        water.setFoamHardness(0.3f);
        water.setFoamExistence(new Vector3f(0.8f, 8f, 1f));
        water.setReflectionDisplace(50);
        water.setRefractionConstant(0.25f);
        water.setColorExtinction(new Vector3f(30, 50, 70));
        water.setCausticsIntensity(0.4f);
        water.setWaveScale(0.003f);
        water.setMaxAmplitude(2f);
        water.setFoamTexture((Texture2D) assetManager.loadTexture("Common/MatDefs/Water/Textures/foam2.jpg"));
        water.setRefractionStrength(0.2f);
		water.setWaterHeight(0);
		water.setSpeed(.5f);
		return water;
	}

	private Spatial loadMap() {
		Material material = new Material(assetManager, "Common/MatDefs/Terrain/TerrainLighting.j3md");
		material.setBoolean("useTriPlanarMapping", false);
		material.setBoolean("WardIso", true);
		material.setTexture("AlphaMap", assetManager.loadTexture("Textures/Terrain/splat/alphamap.png"));

		Texture grass = assetManager.loadTexture("Textures/Terrain/splat/grass.jpg");
		grass.setWrap(WrapMode.Repeat);
		Texture grassN = assetManager.loadTexture("Textures/Terrain/splat/grass_normal.jpg");
		grassN.setWrap(WrapMode.Repeat);
		material.setTexture("DiffuseMap", grass);
		material.setTexture("NormalMap", grassN);
		material.setFloat("DiffuseMap_0_scale", 64);
//		material.setFloat("Tex1Scale", grassScale);

		// DIRT texture
		Texture dirt = assetManager.loadTexture("Textures/Terrain/splat/dirt.jpg");
		dirt.setWrap(WrapMode.Repeat);
		Texture dirtN = assetManager.loadTexture("Textures/Terrain/splat/dirt_normal.png");
		dirtN.setWrap(WrapMode.Repeat);
		material.setTexture("DiffuseMap_1", dirt);
		material.setTexture("NormalMap_1", dirtN);
		material.setFloat("DiffuseMap_1_scale", 16);
//		material.setFloat("DiffuseMap_2", dirtScale);

		// ROCK texture
		Texture rock = assetManager.loadTexture("Textures/Terrain/splat/road.jpg");
		rock.setWrap(WrapMode.Repeat);
		Texture rockN = assetManager.loadTexture("Textures/Terrain/splat/road_normal.png");
		rockN.setWrap(WrapMode.Repeat);
		material.setTexture("DiffuseMap_2", rock);
		material.setTexture("NormalMap_2", rockN);
		material.setFloat("DiffuseMap_2_scale", 128);
//		material.setFloat("Tex3Scale", rockScale);

		Texture heightMapImage = assetManager.loadTexture("Textures/Terrain/splat/mountains1024.jpg");
		AbstractHeightMap heightmap = new ImageBasedHeightMap(heightMapImage.getImage(), 1f);
		heightmap.load();

		TerrainQuad terrain = new TerrainQuad("terrain", 65, 1025, heightmap.getHeightMap());
		terrain.setMaterial(material);
		TerrainLodControl control = new TerrainLodControl(terrain, getCamera());
		control.setLodCalculator(new DistanceLodCalculator(65, 2.7f)); // patch size, and a multiplier
		terrain.setLocalScale(2f, 0.5f, 2f);
		terrain.setLocalTranslation(0, -60, 0);
		terrain.setShadowMode(ShadowMode.Receive);
//		terrain.setShadowMode(ShadowMode.CastAndReceive);

		return terrain;
	}

	private DirectionalLightShadowFilter buildShadow(DirectionalLight sun) {
		DirectionalLightShadowFilter dlsf = new DirectionalLightShadowFilter(assetManager, 4096, 1);
		dlsf.setLight(sun);
		dlsf.setEnabled(true);
//		dlsf.setLambda(.1f);
//		dlsf.setEdgesThickness(100);
//		dlsf.setEdgeFilteringMode(EdgeFilteringMode.PCF8);
//		dlsf.setShadowZExtend(10);
		dlsf.setShadowIntensity(.8f);
		return dlsf;
//		FilterPostProcessor fpp = new FilterPostProcessor(assetManager);
//		fpp.addFilter(dlsf);
//		return fpp;
	}


	private LightProbe buildProbe(Node sceneNode) {
		LightProbe probe = FastLightProbeFactory
				.makeProbe(renderManager, assetManager, 256, Vector3f.ZERO, 1, 1000f, sceneNode);
		probe.getArea().setRadius(100);
		return probe;
	}

//
//	private void debugNodes(String path, Spatial model) {
//		System.out.println(path + model.getName());
//		if (model instanceof Node) {
//			path = path + "  ";
//			for (Spatial c : ((Node) model).getChildren()) {
//				debugNodes(path, c);
//			}
//		}
//	}


//	private int frame = 0;
//	private Node tex;

	@Override
	public void simpleUpdate(float tpf) {
//		frame++;
//
//		if (frame == 2) {
////			model.removeFromParent();
//			LightProbe probe;
//
//			if (USE_ACCELERATED_BAKING) {
//				probe = buildProbe();
//			} else {
//				probe = LightProbeFactory
//						.makeProbe(stateManager.getState(EnvironmentCamera.class), rootNode,
//								new JobProgressAdapter<LightProbe>() {
//
//									@Override
//									public void done(LightProbe result) {
//										System.err.println("Done rendering env maps");
//										tex = EnvMapUtils
//												.getCubeMapCrossDebugViewWithMipMaps(result.getPrefilteredEnvMap(),
//														assetManager);
//									}
//								});
//			}
//			probe.getArea().setRadius(100);
//			rootNode.addLight(probe);
//			// getStateManager().getState(EnvironmentManager.class).addEnvProbe(probe);
////			rootNode.attachChild(model);
//		}
//		if (frame > 10 && model.getParent() == null) {
//		}
	}

	@Override
	public void simpleRender(RenderManager rm) {
	}
}
