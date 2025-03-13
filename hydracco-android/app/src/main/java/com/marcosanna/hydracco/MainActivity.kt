package com.marcosanna.hydracco

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import com.marcosanna.hydracco.ui.theme.HydraccoTheme
import io.flutter.embedding.android.FlutterActivity

/**
 * Main entry point of the android app. As I am not experienced in Android,
 * this simply opens one badge in a new activity. Or maybe two.
 */
class MainActivity : ComponentActivity() {
    @OptIn(ExperimentalMaterial3Api::class)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            HydraccoTheme {
                Scaffold(modifier = Modifier.fillMaxSize(),
                    topBar = {
                    TopAppBar(
                        title = {
                            Text("Hydracco")
                        }
                    )
                }, floatingActionButton = {
                    FloatingButton()
                    }) { innerPadding ->
                    Column(modifier = Modifier.padding(innerPadding).fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally) {
                        Text(
                            "Desperately trying to get this text centered...\nHooray!",
                            textAlign = TextAlign.Center
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun FloatingButton() {
    val context = LocalContext.current
    Button(onClick = {
        context.startActivity(FlutterActivity
            .withNewEngine()
            .initialRoute("/badge")
            .build(context))
    }) {
        Text(text = "Reward")
    }
}