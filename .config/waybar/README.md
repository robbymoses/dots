# Waybar Custom Modules

This repository provides a collection of custom Waybar modules designed to enhance your Waybar experience. To integrate and utilize these modules, follow the steps below.

## 📁 Directory Structure

```
.config/waybar/
├── modules/           # Custom modules in JSON format
├── buildConfig.sh     # Script to generate the Waybar configuration
└── style.css          # Optional: Custom CSS for styling
```

## 🛠️ Adding a New Module

1. **Create a New JSON File:**

   * Navigate to the `modules/` directory.
   * Add a new JSON file for your module, e.g., `custom/my_module.json`.

2. **Define the Module Configuration:**

   * Ensure the JSON file contains the necessary configuration for your module. A typical structure might look like:

     ```json
      {
         "cpu": {
            "interval": 1,
            "format": "{usage}%"
         }
      }
     ```

   * Refer to the [Waybar Custom Module Documentation](https://man.uex.se/5/waybar-custom) for detailed configuration options.

## ⚙️ Generating the Configuration

After adding your module:

1. **Run the Build Script:**

   * Execute the `buildConfig.sh` script to generate the Waybar configuration file.

     ```bash
     ./buildConfig.sh
     ```

2. **Add Module to base.json:**

   * Add your module to the correct layout array (modules-left, modules-center, modules-right) in the base.json file. 


## 🎨 Styling the Module

* Customize the appearance of your module by editing the `style.css` file.
* Apply CSS classes as defined in your module's JSON configuration to style the module accordingly.

---

Feel free to reach out if you need further assistance or have specific questions about configuring your Waybar setup!
